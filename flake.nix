{
  description = "MBTA HASTUS Schedule Decoder";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs, flake-utils }:
	 flake-utils.lib.eachDefaultSystem (system:
		let pkgs = nixpkgs.legacyPackages.${system}; in
		{
			packages = rec {
				pages = pkgs.callPackage ./package.nix {
					src = self;
					version = "0.0.1";
				};
				default = pages;
			};

			checks = {
				inherit (self.packages.${system}) pages;
			};
		}
	 );
}
