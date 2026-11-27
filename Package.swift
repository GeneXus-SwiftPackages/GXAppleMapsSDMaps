// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAppleMapsSDMaps",
	platforms: [.iOS("15.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXAppleMapsSDMaps",
			targets: ["GXAppleMapsSDMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAppleMaps.git", exact: "5.1.0-beta.21"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "5.1.0-beta.21"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "5.1.0-beta.21")
	],
	targets: [
		.target(name: "GXAppleMapsSDMapsWrapper",
				dependencies: [
					"GXAppleMapsSDMaps",
					.product(name: "GXAppleMaps", package: "GXAppleMaps", condition: .when(platforms: [.iOS, .visionOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .visionOS])),
					.product(name: "GXUCMaps", package: "GXUCMaps", condition: .when(platforms: [.iOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAppleMapsSDMaps",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMapsSDMaps-5.1.0-beta.21.xcframework.zip",
			checksum: "c9d315a9892107bd16e9426740d03b59cc4a4f5d2695fb4c5f5d07cfa33e4ace"
		)
	]
)