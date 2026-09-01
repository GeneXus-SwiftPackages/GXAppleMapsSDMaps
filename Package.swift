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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAppleMaps.git", exact: "5.0.0-beta.5"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "5.0.0-beta.5"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "5.0.0-beta.5")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMapsSDMaps-5.0.0-beta.5.xcframework.zip",
			checksum: "762ab041f6ff99e38788328dec5082fe3ea0a6af7187f30e11812c41f614ea08"
		)
	]
)