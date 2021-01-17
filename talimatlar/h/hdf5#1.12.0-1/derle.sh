cd $SRC
mkdir -p build && cd build
cmake ../${isim}-${surum} \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_SHARED_LIBS=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DHDF5_BUILD_HL_LIB=ON \
	-DHDF5_BUILD_CPP_LIB=ON \
	-DHDF5_BUILD_FORTRAN=ON \
	-DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
	-DHDF5_ENABLE_SZIP_SUPPORT=ON \
	-DHDF5_ENABLE_SZIP_ENCODING=ON

make
