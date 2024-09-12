#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "GraphicsRulesMaker" for configuration "Release"
set_property(TARGET GraphicsRulesMaker APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(GraphicsRulesMaker PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libGraphicsRulesMaker.dll.a"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libGraphicsRulesMaker.dll"
  )

list(APPEND _cmake_import_check_targets GraphicsRulesMaker )
list(APPEND _cmake_import_check_files_for_GraphicsRulesMaker "${_IMPORT_PREFIX}/lib/libGraphicsRulesMaker.dll.a" "${_IMPORT_PREFIX}/bin/libGraphicsRulesMaker.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
