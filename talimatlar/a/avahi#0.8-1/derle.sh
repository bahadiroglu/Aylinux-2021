patch -Np1 -i /sources/reverse-move-to-run.patch
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --with-distro=none \
    --disable-{gtk,gtk3,qt3,qt4,qt5,python} \
    --disable-{pygobject,python-dbus,mono,mono-doc,nls} \
    --enable-compat-libdns_sd
