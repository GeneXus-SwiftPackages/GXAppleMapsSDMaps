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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAppleMaps.git", exact: "4.0.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.0.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "4.0.6")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXAppleMapsSDMaps-4.0.6.xcframework.zip",
			checksum: "a8927f911abea34b3d3e060885aa6fbfe047cbd1feb218e7fc70b8fbc98a362b"
		)
	]
)