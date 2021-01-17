cd build

DESTDIR="${PKG}" ninja install

# Move analyzer scripts out of /usr/libexec
mv "${PKG}"/usr/libexec/{ccc,c++}-analyzer "${PKG}/usr/lib/clang/"
rmdir "${PKG}/usr/libexec"
sed -i 's|libexec|lib/clang|' "${PKG}/usr/bin/scan-build"

# Install Python bindings
install -d "${PKG}/usr/lib/python2.7/site-packages"
cp -a ../bindings/python/clang "${PKG}/usr/lib/python2.7/site-packages/"
python2 -m compileall "${PKG}/usr/lib/python2.7"
python2 -O -m compileall "${PKG}/usr/lib/python2.7"

install -d "${PKG}/usr/lib/python3.7/site-packages"
cp -a ../bindings/python/clang "${PKG}/usr/lib/python3.7/site-packages/"
python3 -m compileall "${PKG}/usr/lib/python3.7"
python3 -O -m compileall "${PKG}/usr/lib/python3.7"
python3 -OO -m compileall "${PKG}/usr/lib/python3.7"

# Fix shebang in Python2 script
sed -i '1s|/usr/bin/env python$|&2|' \
"${PKG}"/usr/share/${isim}/run-find-all-symbols.py

# Compile Python scripts
python2 -m compileall "${PKG}/usr/share/clang"
python2 -O -m compileall "${PKG}/usr/share/clang"

python3 -m compileall "${PKG}/usr/share" -x 'clang-include-fixer|run-find-all-symbols'
python3 -O -m compileall "${PKG}/usr/share" -x 'clang-include-fixer|run-find-all-symbols'
python3 -OO -m compileall "${PKG}/usr/share" -x 'clang-include-fixer|run-find-all-symbols'

