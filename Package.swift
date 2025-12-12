// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwiftProject",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
    ],
    products: [],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            exact: "5.9.1"
        ),
    ],
    targets: []
)