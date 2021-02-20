cd $SRC/nss-$surum

#  nsprver="$(pkg-config --modversion nspr)"
  sed nss/pkg/pkg-config/nss.pc.in \
    -e "s,%libdir%,/usr/lib,g" \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,/usr/bin,g" \
    -e "s,%includedir%,/usr/include/nss,g" \
    -e "s,%NSPR_VERSION%,$(pkg-config --modversion nspr),g" \
    -e "s,%NSS_VERSION%,$surum,g" |
    install -Dm644 /dev/stdin "$PKG/usr/lib/pkgconfig/nss.pc"

  ln -s nss.pc "$PKG/usr/lib/pkgconfig/mozilla-nss.pc"

  install -Dt "$PKG/usr/lib" dist/Release/lib/*.so
  
  cd $SRC/nss-$surum
local vmajor vminor vpatch
  { read vmajor; read vminor; read vpatch; } \
    < <(awk '/#define.*NSS_V(MAJOR|MINOR|PATCH)/ {print $3}' nss/lib/nss/nss.h)

  sed nss/pkg/pkg-config/nss-config.in \
    -e "s,@libdir@,/usr/lib,g" \
    -e "s,@prefix@,/usr/bin,g" \
    -e "s,@exec_prefix@,/usr/bin,g" \
    -e "s,@includedir@,/usr/include/nss,g" \
    -e "s,@MOD_MAJOR_VERSION@,$vmajor,g" \
    -e "s,@MOD_MINOR_VERSION@,$vminor,g" \
    -e "s,@MOD_PATCH_VERSION@,$vpatch,g" |
    install -D /dev/stdin "$PKG/usr/bin/nss-config"

  install -Dt "$PKG/usr/bin" \
    dist/Release/bin/{*util,shlibsign,signtool,signver,ssltap}

  install -Dt "$PKG/usr/include/nss" -m644 dist/public/nss/*.h

  # Replace built-in trust with p11-kit connection
  ln -s pkcs11/p11-kit-trust.so "$PKG/usr/lib/p11-kit-trust.so"
  ln -sf p11-kit-trust.so "$PKG/usr/lib/libnssckbi.so"
  
  install -Dm644 ca-bundle.trust.p11-kit \
    "$PKG/usr/share/ca-certificates/trust-source/mozilla.trust.p11-kit"
