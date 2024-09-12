#ifndef GRAPHICSRULESMAKER_CONFIG_H
#define GRAPHICSRULESMAKER_CONFIG_H

#if defined(GRAPHICSRULESMAKER_LIBRARY)
#  define GRAPHICSRULESMAKER_EXPORT Q_DECL_EXPORT
#else
#  define GRAPHICSRULESMAKER_EXPORT Q_DECL_IMPORT
#endif

/**
 * The installation directory for the default plugins
 */
#define GRAPHICSRULESMAKER_PLUGIN_PATH "/usr/x86_64-w64-mingw32/bin/gamewriters/"

/**
 * The installation directory for translation files
 */
#define GRAPHICSRULESMAKER_TRANSLATIONS_PATH "/usr/x86_64-w64-mingw32/share"

/**
 * The library version
 */
#define GRAPHICSRULESMAKER_VERSION "2.3.0.0"

/**
 * The last copyright year
 */
#define GRAPHICSRULESMAKER_COPYRIGHT_YEAR "2024"

#endif // GRAPHICSRULESMAKER_CONFIG_H

