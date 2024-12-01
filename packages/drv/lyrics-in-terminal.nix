{
  lib,
  python3Packages,
  fetchFromGitHub,
}:
python3Packages.buildPythonApplication rec {
  pname = "lyrics-in-terminal";
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Jugran";
    repo = pname;
    rev = version;
    hash = "sha512-aASEU7x2o4gGC7B0mSIvCjyhkOnz1mqhCp5QjLf9izrBGPKBC3+KyEt9rBtca0tyekqoeMABGgqM2ZIJUVu+AQ=="; 
  };

  dontUseCmakeConfigure = true;

  propagatedBuildInputs = [
    python3Packages.dbus-python
    python3Packages.mpd2
    python3Packages.requests
  ];

  preBuild = ''
    export HOME=$(mktemp -d)
  '';

  buildInputs = [
    python3Packages.setuptools
    python3Packages.dbus-python
    python3Packages.mpd2
    python3Packages.requests
  ];

  meta = with lib; {
    description = "Shows lyrics of songs from your favourite music player in terminal";
    homepage = "https://github.com/Jugran/lyrics-in-terminal";
    license = licenses.mit;
    mainProgram = "lyrics";
  };
}
