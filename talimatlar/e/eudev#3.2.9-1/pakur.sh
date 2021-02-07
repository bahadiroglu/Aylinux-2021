cd $SRC/eudev
mkdir -pv $PKG/usr/lib/{firmware,udev/devices/pts,udev/devices/shm}
	
mkdir -pv $PKG/usr/lib/udev/rules.d
make CFLAGS="$CFLAGS -D_GNU_SOURCE"
    make install DESTDIR=$PKG

# man sayfalar
pushd man
make DESTDIR=$PKG install-man7 install-man8

cd $SRC
make -j1 -f udev-lfs-20171102/Makefile.lfs DESTDIR=$PKG install

 # create binary hwdb
	$PKG/usr/bin/udevadm hwdb --update --root=$PKG

    # Devices
    install -d $PKG/usr/lib/{firmware,udev/devices/{pts,shm}}
    install -d $PKG/run
    

mv -t $PKG/lib $PKG/usr/lib 
