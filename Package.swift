// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HtmlSwift",
    platforms: [
           .macOS(.v11),
           .iOS(.v13),
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HtmlSwift",
            targets: ["HtmlSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.4.3"),
        .package(url: "https://github.com/atacan/pointfreeco-swift-html", branch: "main"),
                 .package(url: "https://github.com/atacan/BinaryBirds-swift-html", from: "1.6.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HtmlSwift",
            dependencies: ["SwiftSoup",
                            .product(name: "Html", package: "pointfreeco-swift-html"),
                           .product(name: "SwiftHtml", package: "BinaryBirds-swift-html"),
                           .product(name: "SwiftFormat", package: "SwiftFormat"),]),
        .testTarget(
            name: "HtmlSwiftTests",
            dependencies: ["HtmlSwift"],
            resources: [
                .process("HtmlFiles")
            ]
        ),
    ]
)
