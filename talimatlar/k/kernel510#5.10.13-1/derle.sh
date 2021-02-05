  set -e
  bsurum=5.10.13
  cd "${SRC}/linux-${bsurum}"

  # standart config
  cat "${SRC}/kernel-${bsurum}-config" > ./.config
  
  export KBUILD_BUILD_USER="Cihan_Alkan"
  export KBUILD_BUILD_HOST="aylinux.kripto.com.tr"
  
  # ayarları onaylama
  make olddefconfig

  # derleme
  export LC_ALL=C
  make -j2 bzImage modules
  set +e
