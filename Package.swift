// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXAppleMapsSDMaps",
	platforms: [.iOS("12.0")],
	products: [
		.library(
			name: "GXAppleMapsSDMaps",
			targets: ["GXAppleMapsSDMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAppleMaps.git", exact: "1.3.0-rc.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.3.0-rc.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "1.3.0-rc.7")
	],
	targets: [
		.target(name: "GXAppleMapsSDMapsWrapper",
				dependencies: [
					"GXAppleMapsSDMaps",
					.product(name: "GXAppleMaps", package: "GXAppleMaps", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS])),
					.product(name: "GXUCMaps", package: "GXUCMaps", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAppleMapsSDMaps",
			url: "https://pkgs.genexus.dev/iOS/preview/GXAppleMapsSDMaps-1.3.0-rc.7.xcframework.zip",
			checksum: "497833313b4807e716b17aac5111261d427c86018a8a57b1f79991e8512f7eec"
		)
	]
)