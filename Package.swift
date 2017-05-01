// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "VaporStencilProvider",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1),
        .Package(url: "https://github.com/kylef/Stencil.git", majorVersion:0,minor: 9)
    ]
)
