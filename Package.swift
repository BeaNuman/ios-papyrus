// swift-tools-version: 5.8

import PackageDescription

let settings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency")
]

let package = Package(
    name: "Papyrus",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .watchOS(.v7),
        .tvOS(.v16)
    ],
    products: [
        .library(
            name: "Papyrus",
            targets: ["Papyrus"]),
    ],
    dependencies: [.package(url: "https://github.com/apple/swift-async-algorithms", from: "1.0.0")],
    targets: [
        .target(
            name: "Papyrus",
            dependencies: [
                .product(name: "AsyncAlgorithms", package: "swift-async-algorithms"),
            ],
            swiftSettings: settings
        ),
        .testTarget(
            name: "Unit",
            dependencies: ["Papyrus"],
            exclude: ["Supporting Files/Unit.xctestplan"],
            swiftSettings: settings
        ),
        .testTarget(
            name: "Performance",
            dependencies: ["Papyrus"],
            exclude: ["Supporting Files/Performance.xctestplan"]
        ),
    ]
)
