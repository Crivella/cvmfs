#!/bin/sh

find . -name '*.cc' -exec sed -i 's/_unlocked//g' {} \;

make clean
CFLAGS="$CVMFS_BASE_C_FLAGS -fPIC" CXXFLAGS="$CVMFS_BASE_CXX_FLAGS -fPIC --target=${CLANG_TARGET_TRIPLE}" make -j ${CVMFS_BUILD_EXTERNAL_NJOBS}
strip -S libleveldb.a

cp -rv include/leveldb $EXTERNALS_INSTALL_LOCATION/include/
cp -rv libleveldb.a $EXTERNALS_INSTALL_LOCATION/lib/
