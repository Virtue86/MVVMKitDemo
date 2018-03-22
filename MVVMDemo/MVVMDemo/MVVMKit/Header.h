//
//  Header.h
//  MVVMKit
//
//  Created by Virtue on 2018/3/22.
//

#ifndef Header_h
#define Header_h
#define uXCODE_COLORS_ESCAPE            @"\033["
#define uXCODE_COLORS_RESET_FG          uXCODE_COLORS_ESCAPE  @"fg;"
#define uXCODE_COLORS_RESET_BG          uXCODE_COLORS_ESCAPE  @"bg;"
#define uXCODE_COLORS_RESET             uXCODE_COLORS_ESCAPE  @";"

#define SUIExtensionLog(colors, eFormat, format, ...) \
NSLog((uXCODE_COLORS_ESCAPE colors eFormat format uXCODE_COLORS_RESET), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define SUIExtensionLog2(colors, eFormat, format, ...) \
NSLog((uXCODE_COLORS_ESCAPE colors eFormat format uXCODE_COLORS_RESET), ##__VA_ARGS__);
#define SUIExtensionLog3(colors, eFormat, format, ...) \
NSLog((uXCODE_COLORS_ESCAPE colors eFormat uXCODE_COLORS_RESET), __PRETTY_FUNCTION__, __LINE__, #format, format, ##__VA_ARGS__);

#define SUILog(format, ...) SUIExtensionLog(@"fg0,178,238;", @"\n%s\n<%d> ", format, ##__VA_ARGS__)
#define SUILogInfo(format, ...) SUIExtensionLog2(@"fg0,168,0;", @"\n-> ", format, ##__VA_ARGS__)
#define SUILogError(format, ...) SUIExtensionLog2(@"fg255,41,105;", @"\n## ", format, ##__VA_ARGS__)

#define SUILogObj(obj) SUIExtensionLog3(@"fg89,89,207;", @"\n%s\n<%d> %s ⤭ %@ ⤪[;", obj)
#define SUILogInteger(integer) SUIExtensionLog3(@"fg89,89,207;", @"\n%s\n<%d> %s ⤭ %zd ⤪[;", integer)
#define SUILogFloat(float) SUIExtensionLog3(@"fg89,89,207;", @"\n%s\n<%d> %s ⤭ %lf ⤪[;", float)
#define SUILogRect(rect) SUIExtensionLog3(@"fg89,89,207;", @"\n%s\n<%d> %s ⤭ %@ ⤪", NSStringFromCGRect(rect))
#define SUILogSize(size) SUIExtensionLog3(@"fg89,89,207;", @"\n%s\n<%d> %s ⤭ %@ ⤪[;", NSStringFromCGSize(size))
#define SUILogPoint(point) SUIExtensionLog3(@"fg89,89,207;", @"\n%s\n<%d> %s ⤭ %@ ⤪[;", NSStringFromCGPoint(point))
#define SUILogEdgeInsets(edgeInsets) SUIExtensionLog3(@"fg89,89,207;", @"\n%s\n<%d> %s ⤭ %@ ⤪[;", NSStringFromUIEdgeInsets(edgeInsets))
#define SUILogLine SUIExtensionLog(@"fg217,56,41;", @"\n%s\n<%d> ----- ----- ----- -----",)

#define SUIAssert(condition, format, ...) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wformat-extra-args\"") \
if ((condition) == NO) \
SUILogError(format, ##__VA_ARGS__); \
_Pragma("clang diagnostic pop") \
} while (0);

#define SUIAssertParamNotNil(param, format, ...) \
SUIAssert(kNilOrNull(param) == NO, format, ##__VA_ARGS__)

#define kNilOrNull(__ref) (((__ref) == nil) || ([(__ref) isEqual:[NSNull null]]))
#define gClassName(__obj) [NSString stringWithUTF8String:object_getClassName(__obj)]


#endif /* Header_h */
