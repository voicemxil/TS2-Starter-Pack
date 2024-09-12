
# Define a new plugin for GraphicsRulesMaker
# Usage:
#    graphicsrulesmaker_add_plugin(<target name> [<source file> ...])
#
# The created target will be set up to link to the GraphicsRulesMaker core library.
#
macro(graphicsrulesmaker_add_plugin TARGET)
    add_library(${TARGET} MODULE ${ARGN})
    # avoid `lib` prefix for plugins
    set_target_properties(${TARGET} PROPERTIES PREFIX "")
    target_link_libraries(${TARGET} PUBLIC GraphicsRulesMaker)
    if(NOT GraphicsRulesMaker_WITH_QT5)
        target_link_libraries(${TARGET} PUBLIC Qt6::Widgets)
    else()
        target_link_libraries(${TARGET} PUBLIC Qt5::Widgets)
    endif()
endmacro()

# Shorthand to set up translations for a plugin. They will be updated and created if
# QtLinguistTools are found. The file names are based on the target name.
#
# Usage:
#     graphicsrulesmaker_translations(<target> LANGUAGES <langcode1> [<langcode2> ...])
#
# Where the `langcode` arguments refer to language codes as understood by Qt (e.g. `nl`, `en`, `de`, etc).
# A variable <TARGET>_TRANSLATIONS will be defined with paths to the .qm files.
#
# The translation sources (.ts files) will be updated in the source tree. The generated .qm files
# are added to the given target. Installation rules are not created. Install them as FILES to
# ${GraphicsRulesMaker_INSTALL_PLUGIN_DIR}:
#
# Example:
#
#     graphicsrulesmaker_translations(MyPlugin LANGUAGES nl)
#     install(FILES ${MyPlugin_TRANSLATIONS}
#             DESTINATION ${GraphicsRulesMaker_INSTALL_TRANSLATIONS_DIR}
#             COMPONENT myplugin
#     )
#
macro(graphicsrulesmaker_translations TARGET)
    cmake_parse_arguments(_grm_translations "" "" "LANGUAGES" ${ARGN})
    if(NOT GraphicsRulesMaker_WITH_QT5)
        find_package(Qt6LinguistTools NO_CMAKE_FIND_ROOT_PATH)
    else()
        find_package(Qt5LinguistTools NO_CMAKE_FIND_ROOT_PATH)
    endif()

    if(Qt5LinguistTools_FOUND OR Qt6LinguistTools_FOUND)
        message(STATUS "Qt Linguist found - will set up translations for ${TARGET}")
        list(TRANSFORM _grm_translations_LANGUAGES PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/translations/${TARGET}_")
        list(TRANSFORM _grm_translations_LANGUAGES APPEND ".ts")
        qt_create_translation(${TARGET}_TRANSLATIONS
            ${CMAKE_CURRENT_SOURCE_DIR}
            ${_grm_translations_LANGUAGES}
            OPTIONS -source-language "en_US"
        )

        target_sources(${TARGET} PRIVATE ${${TARGET}_TRANSLATIONS})
    endif()
endmacro()
