# /test/UBSanInstrumentedBinaryNoRecover.cmake
# If SANITIZERS_USE_UBSAN is set to ON and include (SanitizeTarget)
# is called, then a target called target_ubsan should be created
# along with target and -fsanitize=undefined and
# -fno-sanitize-recover should be passed when compiling it.
# See LICENCE.md for Copyright information

set (SANITIZERS_USE_UBSAN ON CACHE BOOL "" FORCE)

include (SanitizeTarget)
include (CMakeUnit)

set (SOURCE_FILE ${CMAKE_CURRENT_BINARY_DIR}/Source.cpp)
set (SOURCE_FILE_CONTENTS
     "int main ()\n"
     "{\n"
     "    return 0\;\n"
     "}\n")
file (WRITE ${SOURCE_FILE} ${SOURCE_FILE_CONTENTS})
set (TARGET target)

add_executable (${TARGET} ${SOURCE_FILE})
sanitizer_add_sanitization_to_target (${TARGET})
