# Try to find leveldb
# Once done, this will define
#
# LEVELDB_FOUND       - system has leveldb
# LEVELDB_INCLUDE_DIR - the leveldb include directory
# LEVELDB_LIB_DIR     - the leveldb library directory
#
# LEVELDB_DIR may be defined as a hint for where to look
# LEVELDB_LIBRARIES   - the level db library name(s)

set(LEVELDB_LIB_DIR ${LEVELDB_LIBRARIES})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(leveldb DEFAULT_MSG LEVELDB_LIB_DIR LEVELDB_INCLUDE_DIR )
