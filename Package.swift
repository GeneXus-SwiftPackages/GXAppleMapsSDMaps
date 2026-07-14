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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAppleMaps.git", exact: "4.2.0-beta.30"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-beta.30"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "4.2.0-beta.30")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAppleMapsSDMaps-4.2.0-beta.30.xcframework.zip",
			checksum: "5ce942a614b868b1364e01554634dcc9b1e937728b4afa66f2c3cb1167da7d81"
		)
	]
)