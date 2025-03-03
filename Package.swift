// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MiTuKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MiTuKit",
            targets: ["MiTuKit"]),
    ],
    targets: [
        .target(name: "MiTuKit", path: "Sources"),
    ],
    swiftLanguageVersions: [.v5]
)
