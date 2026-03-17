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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAppleMaps.git", exact: "4.1.0-rc.25"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.1.0-rc.25"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUCMaps.git", exact: "4.1.0-rc.25")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXAppleMapsSDMaps-4.1.0-rc.25.xcframework.zip",
			checksum: "d5b36d4766dca2707f450c2e22434d9c0e64d01c9782a278339b61624a33910a"
		)
	]
)