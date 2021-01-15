#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "InstallPluginCustomPlugin.h"

FOUNDATION_EXPORT double install_plugin_customVersionNumber;
FOUNDATION_EXPORT const unsigned char install_plugin_customVersionString[];

