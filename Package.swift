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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAppleMaps.git", exact: "5.1.0-beta.18"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "5.1.0-beta.18"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "5.1.0-beta.18")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMapsSDMaps-5.1.0-beta.18.xcframework.zip",
			checksum: "18e52a24af84fd55f532ab76058a63397075bb1a1665f7ff5f66d1be0c1a6423"
		)
	]
)