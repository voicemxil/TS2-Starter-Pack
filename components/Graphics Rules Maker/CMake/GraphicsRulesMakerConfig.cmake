# - Config file for the Graphics Rules Maker package
#
# Copyright (C) 2014-2024 Wouter Haffmans <wouter@simply-life.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was GraphicsRulesMakerConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

# Our library dependencies (contains definitions for IMPORTED targets)
if(NOT TARGET GraphicsRulesMaker AND NOT GraphicsRulesMaker_BINARY_DIR)
  include("${CMAKE_CURRENT_LIST_DIR}/GraphicsRulesMakerTargets.cmake")
endif()

# These are relative paths
set(GraphicsRulesMaker_INSTALL_PLUGIN_DIR "bin/gamewriters/")
set(GraphicsRulesMaker_INSTALL_TRANSLATIONS_DIR "share")

set(GraphicsRulesMaker_WITH_QT5 "OFF")

include("${CMAKE_CURRENT_LIST_DIR}/GraphicsRulesMakerMacros.cmake")

# Note: dependencies may mess up the package prefix and therefore paths used above -> do this last!
include(CMakeFindDependencyMacro)
if (NOT GraphicsRulesMaker_WITH_QT5)
    find_dependency(Qt6Widgets 6.2)
else()
    find_dependency(Qt5Widgets 5.15)
endif()
