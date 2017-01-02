//
//  DebugLog.h
//  FBWaterfallLayout
//
//  Created by 김민아 on 2016. 12. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#ifndef DebugLog_h

#define DebugLog_h
#define NSLog( s, ... ) NSLog( @"%@ : %d => %@\n\n", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#if (defined DEBUG) || (defined INHOUSE)
#define LogGreen(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define LogYellow(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define LogBlue(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog(@"😡"frmt, ##__VA_ARGS__)
#else
#define LogBlue(frmt, ...)
#define LogRed(frmt, ...)
#define LogGreen(frmt, ...)
#define LogYellow(frmt, ...)
#endif

#endif /* DebugLog_h */
