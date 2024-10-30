## Create the Image

Run nix develop to download the latest version of arion, and the correct version
of nixpkgs to use for the image.

    $ nix develop

Then we can simply ask arion to run the services defined in arion-compose.nix

    $ arion up -d
