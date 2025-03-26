// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let sdkName = "KNSDKCoreBundle"
let version = "1.0.1"
let sdkNexusUrl = ""
let sdkChecksum = ""
let realmVersion = "10.50.0"


let package = Package(
    name: sdkName,
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KNSDKCore",
            targets: ["KNSDKCoreBundle"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", from: Version(stringLiteral: realmVersion))
    ],
    targets: getTargets()
)

func getTargets() -> [Target] {
    let targets: [Target]  = [
        .binaryTarget(name: sdkName,
                      url: sdkNexusUrl,
                      checksum: sdkChecksum),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "RealmSwift", package: "RealmSwift"),
                ],
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]
        )
    ]
    
    return targets
}
