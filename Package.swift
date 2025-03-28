// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let sdkName = "KNSDKCore"
let version = "1.0.1"
let sdkNexusUrl = "https://admin-devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/KNSDKCore/1.0.1/KNSDKCore.xcframework.zip"
let sdkChecksum = "18d2fbf474b5b8af1d4147161cb3e73975fe13d08d666ae73500a95e06fa16b0"
let realmVersion = "10.49.3"


let package = Package(
    name: sdkName,
    products: [
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
        .target(name: "KNSDKCoreBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "RealmSwift", package: "realm-swift"),
                ],
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]
        )
    ]
    
    return targets
}
