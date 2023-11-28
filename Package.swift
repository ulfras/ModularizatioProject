// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RAWGCorePackage",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RAWGCorePackage",
            targets: ["RAWGCorePackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package URL */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.10.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RAWGCorePackage",
            dependencies: ["Alamofire", "RxSwift", .product(name: "Realm", package: "realm-swift"), .product(name: "RealmSwift", package: "realm-swift")]),
        .testTarget(
            name: "RAWGCorePackageTests",
            dependencies: ["RAWGCorePackage"]),
    ]
)
