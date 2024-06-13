# Scoop-mtb

[![Tests](https://github.com/melmass/scoop-mtb/actions/workflows/ci.yml/badge.svg)](https://github.com/melmass/scoop-mtb/actions/workflows/ci.yml) [![Excavator](https://github.com/melmass/scoop-mtb/actions/workflows/excavator.yml/badge.svg)](https://github.com/melmass/scoop-mtb/actions/workflows/excavator.yml)

## Usage

Just add this repo as a bucket:
```sh
scoop bucket add mtb https://github.com/melMass/scoop-mtb.git
```
## If you want to contribute
You need to install pre-commit to avoid unneeded back and forth on things that can be detected programmatically (most rules come from Scoop "guidelines")
```sh
# the repo uses pre-commit (pip install pre-commit)
pre-commit install
```

## Bucket Content

### Applications


|thumbnail|name|description|
| - | - | - |
|<img width=64 src="https://avatars.githubusercontent.com/u/1728152?s=200&v=4"/>|[cuda versions](https://developer.nvidia.com/cuda-toolkit)|a parallel computing platform and programming model that makes using a GPU for general purpose computing simple. This bucket has **11.8** and **12.1**|
|<img width=64 src="https://avatars.githubusercontent.com/u/2639205?s=200&v=4"/>|[dashlane-cli](https://dashlane.github.io/dashlane-cli)| 👩‍💻 Dashlane CLI - Access your secrets in your terminal, servers and CI/CD |
|<img width=100 src="https://www.embree.org/images/oneapi-word-mark-embree-stacked-3000.png"/>|[embree](https://www.embree.org/)|ray tracing kernels library by Intel. This bucket has a `embree` (auto updating from upstream), and `embree3` locked to 3.15.5
|<img width=64 src="https://avatars.githubusercontent.com/u/20556043?s=200&v=4"/> | [gaffer](https://github.com/GafferHQ/gaffer)| Gaffer is a node-based application for lookdev, lighting and automation
|<img width=64 src="https://github.com/raphamorim/rio/raw/main/misc/logo.svg"/>|[rio](https://raphamorim.io/rio/)|hardware-accelerated GPU terminal emulator focusing to run in desktops and browsers|
|<img width=64 src="https://avatars.githubusercontent.com/u/68075353?s=200&v=4"/>|[tool3](https://tooll.io/)|open source software to create realtime motion graphics, akin to TouchDesigner
|<img width=64 src="https://wezfurlong.org/wezterm/favicon.svg"/>|[wezterm-nightly-mtb](https://wezfurlong.org/wezterm/)|GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust. The reason I made this recipe are explained [here](https://github.com/wez/wezterm/issues/5530), you probably don't need it |
|<img width=64 src="https://avatars.githubusercontent.com/u/67482629?s=200&v=4"/>|[zebar](https://github.com/glzr-io/zebar)|customizable and cross-platform taskbars, desktop widgets, and popups.|

### Assets

#### Fonts
|thumbnail|name|description|
| - | - | - |
|<img width=200 src="https://github.com/melMass/scoop-mtb/assets/7041726/55a9cbbf-f393-4610-a431-0a98396e58f7">|[geist](https://vercel.com/font)|created by Vercel in collaboration with Basement Studio.


