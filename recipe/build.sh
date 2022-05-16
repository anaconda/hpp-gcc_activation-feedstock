
CBUILD=$(${PREFIX}/bin/*-gcc -dumpmachine)
CHOST=${cpu_arch}-conda-linux-gnu

FINAL_CFLAGS=FINAL_CFLAGS_${target_platform_u}
FINAL_DEBUG_CFLAGS=FINAL_DEBUG_CFLAGS_${target_platform_u}
FINAL_CXXFLAGS=FINAL_CXXFLAGS_${target_platform_u}
FINAL_DEBUG_CXXFLAGS=FINAL_DEBUG_CXXFLAGS_${target_platform_u}
FINAL_FFLAGS=FINAL_FFLAGS_${target_platform_u}
FINAL_DEBUG_FFLAGS=FINAL_DEBUG_FFLAGS_${target_platform_u}
FINAL_LDFLAGS=FINAL_LDFLAGS_${target_platform_u}
FINAL_CONDA_PYTHON_SYSCONFIGDATA_NAME=FINAL_CONDA_PYTHON_SYSCONFIGDATA_NAME_${target_platform_u}

if [ -z "${!FINAL_CFLAGS}" ]; then
    echo "FINAL_CFLAGS not set.  Did you pass in a flags variant config file?"
    exit 1
fi

# we just provide native (cross) compilers ...
export CONDA_BUILD_CROSS_COMPILATION=""

find . -name "*activate*.sh" -exec sed -i.bak "s|@LINUX_MACHINE@|${linux_machine}|g"                                                "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@CBUILD@|${CBUILD}|g"                                                              "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@CHOST@|${CHOST}|g"                                                                "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@CPPFLAGS@|${FINAL_CPPFLAGS}|g"                                                    "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@DEBUG_CPPFLAGS@|${FINAL_DEBUG_CPPFLAGS}|g"                                        "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@CFLAGS@|${!FINAL_CFLAGS}|g"                                                       "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@DEBUG_CFLAGS@|${!FINAL_DEBUG_CFLAGS}|g"                                           "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@CXXFLAGS@|${!FINAL_CXXFLAGS}|g"                                                   "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@DEBUG_CXXFLAGS@|${!FINAL_DEBUG_CXXFLAGS}|g"                                       "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@FFLAGS@|${!FINAL_FFLAGS}|g"                                                       "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@DEBUG_FFLAGS@|${!FINAL_DEBUG_FFLAGS}|g"                                           "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@LDFLAGS@|${!FINAL_LDFLAGS}|g"                                                     "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@_CONDA_PYTHON_SYSCONFIGDATA_NAME@|${!FINAL_CONDA_PYTHON_SYSCONFIGDATA_NAME}|g"    "{}" \;
find . -name "*activate*.sh" -exec sed -i.bak "s|@CONDA_BUILD_CROSS_COMPILATION@|${CONDA_BUILD_CROSS_COMPILATION}|g"                "{}" \;

find . -name "*activate*.sh.bak" -exec rm "{}" \;
