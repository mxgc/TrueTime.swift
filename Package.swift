// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrueTime.swift",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "TrueTime",
            targets: ["TrueTime"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/typelift/SwiftCheck.git", from: "0.8.1"),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "8.0.1")),
        .package(url: "https://github.com/Quick/Quick", from: "2.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TrueTime",
            dependencies: ["ObjCTrueTime"]
        ),
        
        .target(
            name: "ObjCTrueTime"
        ),

        .testTarget(
            name: "TrueTimeTests",
            dependencies: ["TrueTime", "SwiftCheck", "Nimble", "Quick", "ObjCTrueTime"],
            path: "Tests"
        ),
    ]
)
