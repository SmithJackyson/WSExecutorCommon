// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "WSExecutorCommon",
  platforms: [
    .iOS(.v15),
    .macOS(.v12)
  ],
  products: [
    .library(
      name: "WSExecutorCommon",
      targets: ["WSExecutorCommon", "WSSwiftExecutorCommon"]
    ),
  ],
  targets: [
    .target(
      name: "WSExecutorCommon",
      path: "Sources",
      publicHeadersPath: "public"
    ),
    .target(
      name: "WSSwiftExecutorCommon",
      dependencies: ["WSExecutorCommon"],
      path: "SwiftSources",
      publicHeadersPath: "public"
    ),
  ]
)
