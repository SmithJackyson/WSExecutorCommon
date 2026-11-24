//
//  WSSwiftExecutorDefinition.swift
//  WSExecutorCommon
//
//  Created by SmithJackyson on 2026/11/22.
//

import WSExecutorCommon

public typealias WSSwiftExecutor = @convention(c) (WSExecutorContext) -> Void
public typealias WSSwiftExecutorString = @convention(c) () -> UnsafePointer<CChar>
public typealias WSSwiftExecutorOptionalString = @convention(c) () -> UnsafePointer<CChar>?

public struct WSSwiftExecutorOptions {
  public var period: WSExecutorPeriod
  public var priority: WSExecutorPriority
  public var group: String?
  public var targetClass: String?
  public var delayTime: WSExecutorTime
  public var timeout: WSExecutorTime
  public var flags: WSExecutorFlags
  
  public init(
    period: WSExecutorPeriod,
    priority: WSExecutorPriority,
    group: String? = nil,
    targetClass: String? = nil,
    delayTime: WSExecutorTime = 0,
    timeout: WSExecutorTime = 0,
    flags: WSExecutorFlags = []
  ) {
    self.period = period
    self.priority = priority
    self.group = group
    self.targetClass = targetClass
    self.delayTime = delayTime
    self.timeout = timeout
    self.flags = flags
  }
}
public typealias WSTupleExecutorOptions = (
  period: UInt8,
  priority: UInt8,
  group: WSSwiftExecutorOptionalString,
  targetClass: WSSwiftExecutorOptionalString,
  delayTime: WSExecutorTime,
  timeout: WSExecutorTime,
  flags: UInt32
)

public typealias WSTupleExecutorDescriptor = (
  name: WSSwiftExecutorString,
  options: WSTupleExecutorOptions,
  executor: WSSwiftExecutor
)

extension WSExecutorContext {
  var targetObject: NSObject? {
    target?.takeUnretainedValue()
  }
}

public extension String {
  var wsSwiftPeriod: UInt8 {
    if self == "loadPeriod" {
      return 0
    } else if self == "constructorPeriod" {
      return 1
    } else if self == "willFinishLaunchPeriod" {
      return 2
    } else if self == "didFinishLaunchPeriod" {
      return 3
    } else if self == "didBecomeActivePeriod" {
      return 4
    } else if self == "willResignActivePeriod" {
      return 5
    } else if self == "didEnterBackgroundPeriod" {
      return 6
    } else if self == "willEnterForegroundPeriod" {
      return 7
    } else if self == "receiveMemoryWarningPeriod" {
      return 8
    } else if self == "willTerminatePeriod" {
      return 9
    } else if self == "sceneWillConnectPeriod" {
      return 10
    } else if self == "sceneDidBecomeActivePeriod" {
      return 11
    } else if self == "sceneWillResignActivePeriod" {
      return 12
    } else if self == "sceneDidEnterBackgroundPeriod" {
      return 13
    } else if self == "sceneDidDisconnectPeriod" {
      return 14
    } else if self == "loadViewPeriod" {
      return 15
    } else if self == "viewDidLoadPeriod" {
      return 16
    } else if self == "viewWillAppearPeriod" {
      return 17
    } else if self == "viewIsAppearingPeriod" {
      return 18
    } else if self == "viewDidAppearPeriod" {
      return 19
    } else if self == "viewWillDisappearPeriod" {
      return 20
    } else if self == "viewDidDisappearPeriod" {
      return 21
    }
    assert(false, "WSExecutorPeriod cannot be recognized, modify wsSwiftPeriod in WSSwiftExecutorDefinition")
    return 0
  }
  
  var wsSwiftPriority: UInt8 {
    if self == "WSExecutorPriorityLow" {
      return 0
    } else if self == "WSExecutorPriorityDefault" {
      return 63
    } else if self == "WSExecutorPriorityHigh" {
      return 255
    } else if let priority = UInt8(self) {
      return priority
    }
    assert(false, "WSExecutorPriority cannot be recognized, pass UInt8 type")
    return 0
  }
  
  var wsSwiftFlags: UInt32 {
    if self == "none" {
      return 0
    } else if self == "async" {
      return 1 << 0
    } else if self == "once" {
      return 1 << 1
    } else if self == "inherit" {
      return 1 << 2
    }
    assert(false, "WSExecutorFlags cannot be recognized, modify wsSwiftFlags in WSSwiftExecutorDefinition")
    return 0
  }
}
