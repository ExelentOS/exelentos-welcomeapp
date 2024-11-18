# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appexelentos-welcome_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appexelentos-welcome_autogen.dir/ParseCache.txt"
  "appexelentos-welcome_autogen"
  )
endif()
