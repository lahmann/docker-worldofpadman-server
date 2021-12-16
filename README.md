# Docker World of Padman - Dedicated Server

This docker image creates a dedicated [World of Padman](https://worldofpadman.net) Server.

## What is World of Padman?

From the earliest PadMaps came the mod PadWorld, followed by the next colorful evolution, World of Padman. Developed and headed by cartoonist and illustrator [ENTE](http://enteswelt.de/), PadWorld Entertainment presents a free ware fun shooter for Windows, Mac OS X and Linux, that’s powered by an extended id-Tech3 graphics engine based on the source of [ioquake3](https://ioquake3.org/).

![logo](https://worldofpadman.net/wp-content/uploads/wop_header01.png)

## How to use this image?

The image exposes port 27960 UDP. You can configure the server settings by altering the includes server-settings.cfg and you can add other cfg-files which will be added to the `/app/wop` folder eventually overwriting the default cfg files included in the downloaded release.

As of now the image is based on World of Padman 1.6.2.

### Build this image

```
docker build -t wop-server .
```
This will build the image with the tag `wop-server`. It will be about 1.4GB in size as it downloads the full release archive of World of Padman 1.6.2.

### Start the container

```
docker run -d -p 27960:27960/UDP --name wop-container wop-server
```
This will start the container and map the host's 27960 port to the container port 27960.

Have fun!
