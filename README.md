# asdf-dvc [![Build](https://github.com/fwfurtado/asdf-dvc/actions/workflows/test.yaml/badge.svg)](https://github.com/fwfurtado/asdf-dvc/actions/workflows/test.yaml)

DVC plugin for [asdf](https://github.com/asdf-vm/asdf) version manager


## Install

After installing [asdf](https://github.com/asdf-vm/asdf), install the plugin by running:

```bash
asdf plugin add nodejs https://github.com/fwfurtado/asdf-dvc.git
```


## Use

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of DVC at a system and project level.

Behind the scenes, `asdf-dvc` utilizes [`jq`](https://stedolan.github.io/jq) to filter **DVC** version information [pypi](https://pypi.org/pypi/dvc/json). You can check its [manual](https://stedolan.github.io/jq/manual/) for additional settings and some troubleshooting.
