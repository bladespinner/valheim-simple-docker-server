# Valheim simple docker server

A simple valheim dedicated server hosted via docker using steamcmd internally to pull latest valheim dedicated server on image build.

## How to use
Set the .env arguments
- `NAME` - Optional, Display name of the valheim server
- `WORLD` - Optional, defaults `Dedicated`. Name of the world save file
- `PASSWORD` - Required, Password for the server
- `SAVES` - Required - local save path to be used as dedicated server volumes. Valheim expects a subfolder `worlds` in it which the actual saves are contained.

On first build (or when valheim is updated) execute:

    docker-compose up --build --no-cache

`no-cache` is important since actual layer parameters will not differ between different game versions - since `steamcmd` is only used build-time to pull the latest server version, and the cached layer will always be reused.