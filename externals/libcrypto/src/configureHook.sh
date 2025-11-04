#!/bin/sh

# We install libcrypto into ${EXTERNALS_INSTALL_LOCATION}/crypto in order
# to not taint the standard include / library paths with it. The LibreSSL
# libcrypto is only supposed to be picked up by libcvmfs_crypto

DISABLE_ASM=
if [ "$IS_64_BIT" = "FALSE" ]; then
  DISABLE_ASM="--disable-asm"
fi

### On RISC-V systems, we need to run autoreconf
### to detect the correct architecture
ISA=`grep isa /proc/cpuinfo | head -1 | cut -d: -f2`
echo "System ISA is: $ISA"
case "$ISA" in
*rv64*) autoreconf -vfi
esac
############################

patch -p1 < syslog.patch

mkdir build && cd build
CFLAGS="${CVMFS_BASE_C_FLAGS} -fPIC -Wno-error=implicit-function-declaration" ../configure \
  --enable-static \
  --disable-shared \
  --disable-tests $DISABLE_ASM \
  --prefix=${EXTERNALS_INSTALL_LOCATION}/crypto \
  --host=aarch64-linux-android24
