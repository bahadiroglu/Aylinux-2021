./configure $confopt \
--disable-setuid          \
--enable-cache-owner=root \
--docdir=/usr/share/doc/man-db-2.8.5 \
--with-db=gdbm \
--with-browser=/usr/bin/lynx   \
--with-vgrind=/usr/bin/vgrind  \
--with-grap=/usr/bin/grap \
--with-systemdtmpfilesdir=           \
--with-systemdsystemunitdir=

make
