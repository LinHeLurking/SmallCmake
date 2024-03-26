# Traverse system binary directory to find latest clang compiler.
set(_VER "0")
file(GLOB _CANDIDATES "/usr/bin/clang-*")
foreach(file ${_CANDIDATES})
  # version number 
  if("${file}" MATCHES "^.*clang-([0-9]+)$")
    set(_ALT "${CMAKE_MATCH_1}")
    if("${_ALT}" GREATER_EQUAL "${_VER}")
      set(_VER "${_ALT}")
    endif()
    unset(_ALT)
  endif()
endforeach()

if("${_VER}" EQUAL "0")
  message(FATAL_ERROR "No clang compiler found in /usr/bin/")
  return()
else()
  set(CMAKE_C_COMPILER "/usr/bin/clang-${_VER}")
  set(CMAKE_CXX_COMPILER "/usr/bin/clang++-${_VER}")
  message(STATUS "Setting C compiler as ${CMAKE_C_COMPILER}")
  message(STATUS "Setting CXX compiler as ${CMAKE_CXX_COMPILER}")
endif()
