{ lib
, stdenvNoCC

, src ? ./.
, version ? "0.0.1"
}:
stdenvNoCC.mkDerivation {
	pname = "MBTA HASTUS Schedule Decoder";

	inherit src version;

	installPhase = lib.concatStringsSep "\n" [
		"mkdir $out"
	];
}
