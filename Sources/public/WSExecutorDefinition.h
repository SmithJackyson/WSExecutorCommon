//
//  WSExecutorDefinition.h
//  WSExecutorCommon
//
//  Created by SmithJackyson on 2026/11/10.
//

#ifndef WSExecutorDefinition_h
#define WSExecutorDefinition_h

#import <stdint.h>
#import <stdbool.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct WSExecutorContext {
  __unsafe_unretained NSObject * _Nullable target;
} WSExecutorContext;

typedef void (*WSExecutor)(WSExecutorContext context);
typedef const char* WSExecutorString;
typedef uint8_t WSExecutorPriority;
typedef uint64_t WSExecutorTime;        // Nanoseconds

typedef NS_ENUM(uint8_t, WSExecutorPeriod) {
  WSExecutorLoadPeriod,
  WSExecutorConstructorPeriod,
  
  // MARK: - App Lifecycle
  
  WSExecutorWillFinishLaunchPeriod,
  WSExecutorDidFinishLaunchPeriod,
  WSExecutorDidBecomeActivePeriod,
  WSExecutorWillResignActivePeriod,
  WSExecutorDidEnterBackgroundPeriod,
  WSExecutorWillEnterForegroundPeriod,
  WSExecutorReceiveMemoryWarningPeriod,
  WSExecutorWillTerminatePeriod,
  
  // MARK: - Scene Lifecycle
  
  WSExecutorSceneWillConnectPeriod,
  WSExecutorSceneDidBecomeActivePeriod,
  WSExecutorSceneWillResignActivePeriod,
  WSExecutorSceneWillEnterForegroundPeriod,
  WSExecutorSceneDidEnterBackgroundPeriod,
  WSExecutorSceneDidDisconnectPeriod,
  
  // MARK: - ViewController Lifecycle
  
  WSExecutorLoadViewPeriod,
  WSExecutorViewDidLoadPeriod,
  WSExecutorViewWillAppearPeriod,
  WSExecutorViewIsAppearingPeriod,
  WSExecutorViewDidAppearPeriod,
  WSExecutorViewWillDisappearPeriod,
  WSExecutorViewDidDisappearPeriod,
};

#define WSExecutorPriorityLow       ((uint8_t)0)
#define WSExecutorPriorityDefault   ((uint8_t)63)
#define WSExecutorPriorityHigh      ((uint8_t)255)

typedef NS_OPTIONS(uint32_t, WSExecutorFlags) {
  WSExecutorFlagsNone        = 0,
  WSExecutorFlagsAsync       = 1 << 0,
  WSExecutorFlagsOnce        = 1 << 1,
  WSExecutorFlagsInherit     = 1 << 2,     // subclass inherit from targetClass will call back
};

typedef struct {
  WSExecutorPeriod period;
  WSExecutorPriority priority;
  WSExecutorString _Nullable group;
  WSExecutorString _Nullable targetClass;
  WSExecutorTime delayTime;
  WSExecutorTime timeout;
  WSExecutorFlags flags;
} WSExecutorOptions;

typedef struct {
  WSExecutorString name;
  WSExecutorOptions options;
  WSExecutor executor;
} WSExecutorDescriptor;

NS_ASSUME_NONNULL_END

#endif /* WSExecutorDefinition_h */
