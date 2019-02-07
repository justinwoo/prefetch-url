module Main where

import qualified Data.List as List
import qualified System.Environment as Env
import qualified System.Exit as Exit
import qualified System.Process as Proc

newtype URL = URL String
newtype SHA = SHA String

download :: URL -> IO ()
download url@(URL urlString) = do
  let process = Proc.proc "nix-prefetch-url" [urlString]
  (exitCode, out, err) <- Proc.readCreateProcessWithExitCode process ""
  case exitCode of
    Exit.ExitFailure _ -> do
      putStrLn $ "error while running nix prefetch url:"
      putStr err
      Exit.exitWith exitCode
    Exit.ExitSuccess -> do
      let sha = SHA $ List.filter ((/=) '\n') out
      putStrLn $ prepareOutput url sha

help :: IO ()
help = do
  putStrLn helpMessage

main :: IO ()
main = do
  args <- Env.getArgs

  case args of
    ["help"] -> help
    [] -> help
    [url] -> download (URL url)
    _ -> do
      putStrLn $ "Unknown args received: " <> show args
      Exit.exitWith (Exit.ExitFailure 1)

helpMessage :: String
helpMessage = "\
\ prefetch-url: a utility for getting a nix set expression for a given url and its sha.\n\
\\n\
\ Usage: prefetch-url <url>"

prepareOutput :: URL -> SHA -> String
prepareOutput (URL url) (SHA sha) = "\
\{\n\
\  url = \"" <> url <> "\";\n\
\  sha256 = \"" <> sha <> "\";\n\
\}"
