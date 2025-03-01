self: super: {
    gccPrecompiled = super.gcc.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs or [] ++ [super.stdenv.cc];

        postInstall = (oldAttrs.postInstall or "") + ''
            mkdir -p $out/include/gcc-pch

            STDC_H=$(find ${super.stdenv.cc.cc}/include/c++ -name "stdc++.h" | head -n 1)
            notify-send "Precompiling..."

            g++ -x c++-header $STDC_H -o $out/include/gcc-pch/stdc++.h.gch
        '';

        CXXFLAGS = (oldAttrs.CXXFLAGS or []) ++ [ "-I$out/include/gcc-pch" ];
    });
}
