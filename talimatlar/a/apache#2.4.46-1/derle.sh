sed -e 's#User daemon#User www-data#' \
-e 's#Group daemon#Group www-data#' \
-i docs/conf/httpd.conf.in

cat "${SRC}/milis.layout" >> config.layout

# https://github.com/openssl/openssl/issues/2865
patch -Np1 -i $SRC/openssl-malloc-init.patch

./configure --sbindir=/usr/bin \
	--enable-layout=Milis \
	--enable-mpms-shared=all \
	--enable-modules=all \
	--enable-mods-shared=all \
	--enable-so \
	--enable-ldap --enable-authnz-ldap --enable-authnz-fcgi \
	--enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache \
	--enable-ssl --with-ssl \
	--enable-deflate --enable-cgi --enable-cgid \
	--enable-proxy --enable-proxy-connect \
	--enable-proxy-http --enable-proxy-ftp \
	--enable-dbd --enable-imagemap --enable-ident --enable-cern-meta \
	--enable-lua --enable-xml2enc --enable-http2 \
	--enable-proxy-http2 --enable-md --enable-brotli \
	--with-apr=/usr/bin/apr-1-config \
	--with-apr-util=/usr/bin/apu-1-config \
	--with-pcre=/usr

make
