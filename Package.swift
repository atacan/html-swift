// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HtmlSwift",
    platforms: [
           .macOS(.v11)
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HtmlSwift",
            targets: ["HtmlSwift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/binarybirds/swift-html", from: "1.6.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HtmlSwift",
            dependencies: [.product(name: "SwiftHtml", package: "swift-html"),
                           .product(name: "SwiftFormat", package: "SwiftFormat"),]),
        .testTarget(
            name: "HtmlSwiftTests",
            dependencies: ["HtmlSwift"]),
    ]
)
