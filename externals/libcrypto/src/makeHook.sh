#!/bin/sh

cd build
make clean
make -C crypto install -j ${CVMFS_BUILD_EXTERNAL_NJOBS} CFLAGS="${CFLAGS} --target=aarch64-linux-android24" && \
make -C include install -j ${CVMFS_BUILD_EXTERNAL_NJOBS}
