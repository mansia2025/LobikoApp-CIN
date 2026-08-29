// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LobikoApp",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "LobikoApp",
            targets: ["LobikoApp"]),
    ],
    targets: [
        .target(
            name: "LobikoApp",
            path: "."
        )
    ]
)
