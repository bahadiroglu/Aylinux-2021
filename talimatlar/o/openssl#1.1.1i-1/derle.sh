./Configure --prefix=/tools \
--openssldir=/tools/etc/ssl \
--libdir=lib \
shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-x86_64 \
"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
make depend
make -j1
