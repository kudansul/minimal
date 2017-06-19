#!/bin/sh
SRC_DIR=$(pwd)

# Find the main source directory
cd ../../..
MAIN_SRC_DIR=$(pwd)
cd $SRC_DIR

cd $MAIN_SRC_DIR/work/overlay/nweb

# nweb
cc -O2 $(SRC_DIR)/nweb23.c -o nweb

# client
#cc -O2 $(SRC_DIR)/client.c -o client

echo "nweb has been build."

install -d -m755 "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr"
install -d -m755 "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr/bin"
install -m755 nweb "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr/bin/nweb"
#install -m755 client "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr/bin/client"
install -d -m755 "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/srv/www" # FHS compliant location
install -m022 "$(SRC_DIR)/index.html" "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/svc/www/index.html"
install -m022 "$(SRC_DIR)/favicon.ico" "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/svc/www/favicon.ico"
install -d -m755 "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr/share"
install -d -m755 "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr/share/man"
install -d -m755 "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr/share/man/man8"
install -m022 "$(SRC_DIR)/nweb.8" "$MAIN_SRC_DIR/work/src/minimal_overlay/rootfs/usr/share/man/man8/nweb.8"

echo "nweb has been installed."
echo "type 'man nweb' to see what it can do on your mimial system"

