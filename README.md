# Prefetch URL

[![Build Status](https://travis-ci.org/justinwoo/prefetch-url.svg?branch=master)](https://travis-ci.org/justinwoo/prefetch-url)

Prepare a Nix set from a URL through prefetch-url.

## Literally does what this says

```sh
> prefetch-url https://github.com/jwilm/alacritty/releases/download/v0.2.7/Alacritty-v0.2.7-x86_64.tar.gz
path is '/nix/store/pyfs2w47sz28q5wbw883jx0552qldb7l-Alacritty-v0.2.7-x86_64.tar.gz'
{
  url = "https://github.com/jwilm/alacritty/releases/download/v0.2.7/Alacritty-v0.2.7-x86_64.tar.gz";
  sha256 = "0g11zah3mxz52768c2kr6fjkd2crr2jm194lv14bmpjgvidvj9y4";
}
```

```sh
> prefetch-url https://github.com/jwilm/alacritty/releases/download/v0.2.7/Alacritty-v0.2.7-x86_64.tar.gz > result
path is '/nix/store/pyfs2w47sz28q5wbw883jx0552qldb7l-Alacritty-v0.2.7-x86_64.tar.gz'
> cat result
{
  url = "https://github.com/jwilm/alacritty/releases/download/v0.2.7/Alacritty-v0.2.7-x86_64.tar.gz";
  sha256 = "0g11zah3mxz52768c2kr6fjkd2crr2jm194lv14bmpjgvidvj9y4";
}
```
