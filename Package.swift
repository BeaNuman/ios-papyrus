// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Papyrus",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
    ],
    products: [
        .library(
            name: "Papyrus",
            targets: ["Papyrus"]
        )
    ],
    dependencies: [.package(url: "https://github.com/apple/swift-async-algorithms", from: "1.0.0")],
    targets: [
        .target(
            name: "Papyrus",
            dependencies: [
                .product(name: "AsyncAlgorithms", package: "swift-async-algorithms")
            ]
        ),
        .testTarget(
            name: "Unit",
            dependencies: ["Papyrus"],
            exclude: ["Supporting Files/Unit.xctestplan"]
        ),
        .testTarget(
            name: "Performance",
            dependencies: ["Papyrus"],
            exclude: ["Supporting Files/Performance.xctestplan"]
        )
    ]
)
