This directory contains a recipe for a dummy package that shows how to use the
x86-64-level gcc activation packages.

`conda_build_config.yaml` defines the build matrix, all four compiler
activation are used and the `x86_64_level` variable is set for use in the
recipe's build string.

To build the sample packages run:
```
CONDA_OVERRIDE_ARCHSPEC=zen4 conda build -c https://pkgs.as.anacondaconnect.com/api/repo/hpp/testing .
```
