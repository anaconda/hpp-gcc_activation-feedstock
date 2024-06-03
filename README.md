# gcc_11_activation-feedstock

This recipe produces compiler activation packages for the GCC collection of
compilers version 11.2.0.

These activation packages set environment variables (CFLAGS, CXXFLAGS, etc)
that are optimized for the four different x86-64 microarchitecture levels specified
by v1, v2, v3 and v4.

These map to levels supported by GCC and outline in
https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html and
https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels.

Note that these set the `-march` compiler flag, packages and binaries built
using these flags will not work on processors which do not support the specific
microarchitecture level.

To use these packages specify the optimized version of the compiler in
`conda_build_config.yaml`.

For example:

```
c_compiler:
  - gcc_v3
cxx_compiler:
  - gxx_v3
c_compiler_version:
  - '11'
cxx_compiler_version:
  - '11'
```

To build a particular set of activation packages use:


```
CONDA_OVERRIDE_ARCHSPEC=zen4 conda build --variant-config-files conda_build_config_v2.yaml recipe/
```

The hpp-microarch-level packages need to be built first or be available in a
channel that conda searches.  
https://github.com/anaconda/hpp-microarch-level-feedstock

The `csample` directory contains a small sample showing how to build for all 4 variants.
