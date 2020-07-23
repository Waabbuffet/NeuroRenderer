# CMakeList.txt : CMake project for RayTracer, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

#configure settings
if(WIN32)
	option(H_OS_LINUX "Host OS is OFF" OFF)
	option(H_OS_WINDOWS "Host OS is ON" ON)
ELSE()
	option(H_OS_LINUX "Host OS is ON" ON)
	option(H_OS_WINDOWS "Host OS is OFF" OFF)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -latomic -pthread -lglut -lGLU -lGL")
ENDIF(WIN32)

configure_file(RayTracer.h.in RayTracer.h)

#find directories and setup requirements
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#This will include the trials package
include_directories(${PROJECT_SOURCE_DIR})

file(GLOB RayTracer_SRC
    "*.h"
    "*.cpp"
)

#Start the executable
add_executable(RayTracer ${RayTracer_SRC})

find_package(OpenGL REQUIRED)
find_library(OpenGL_LIBRARY OpenGL)

if(OPENGL_FOUND)
	message('OPENGL_FOUND-is-true')
	include_directories(${OPENGL_INCLUDE_DIRS})
	target_link_libraries (RayTracer ${OPENGL_LIBRARY})
endif(OPENGL_FOUND)


if(WIN32)
	find_path(GLEW_INCLUDE_DIR gl/glew.h)
	find_library(GLEW_LIBRARY glew32)
	include_directories(${GLEW_INCLUDE_DIR})
	target_link_libraries (RayTracer ${GLEW_LIBRARY})
ENDIF(WIN32)


if(UNIX)
	find_package(GLUT REQUIRED)
	find_library(GLUT_LIBRARY GLUT)

	if(GLUT_FOUND)
		message('GLUT_FOUND-is-true')
		include_directories(${GLUT_INCLUDE_DIRS})
		target_link_libraries (RayTracer ${GLUT_LIBRARY})
	endif(GLUT_FOUND)
ENDIF()

# TODO: Add tests and install targets if needed.
