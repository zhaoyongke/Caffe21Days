#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "gflags-shared" for configuration "Release"
set_property(TARGET gflags-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(gflags-shared PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "-pthread"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libgflags.so"
  IMPORTED_SONAME_RELEASE "libgflags.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS gflags-shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_gflags-shared "${_IMPORT_PREFIX}/lib/libgflags.so" )

# Import target "gflags_nothreads-shared" for configuration "Release"
set_property(TARGET gflags_nothreads-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(gflags_nothreads-shared PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libgflags_nothreads.so"
  IMPORTED_SONAME_RELEASE "libgflags_nothreads.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS gflags_nothreads-shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_gflags_nothreads-shared "${_IMPORT_PREFIX}/lib/libgflags_nothreads.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
