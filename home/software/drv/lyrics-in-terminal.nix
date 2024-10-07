{ lib, python3Packages, fetchPypi }:
python3Packages.buildPythonApplication rec {
  pname = "lyrics-in-terminal";
  version = "1.7.0";

  src = fetchPypi {
    inherit version;
    pname = "lyrics_in_terminal";
    hash = "sha256-ngE+5Jx2iSOpBIAK5ENUerQSFD6V6HF4W9eHYpTn76U";
  };

  nativeBuildInputs = with python3Packages; [ setuptools-scm dbus-python ];
  propagatedBuildInputs = with python3Packages; [ pyyaml setuptools ];

  preCheck = ''
    export HOME=$(mktemp -d)
  '';

  meta = with lib; {
    description = "Lyrics in your terminal";
    mainProgram = "lyrics_in_terminal";
    maintainers = with maintainers; [ Prayag2 ];
    homepage = "https://github.com/Jugran/lyrics-in-terminal";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
