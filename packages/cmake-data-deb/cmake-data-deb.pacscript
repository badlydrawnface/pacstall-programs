name="cmake-data-deb"
gives="cmake-data"
version="3.25.1"
description="CMake data files (modules, templates and documentation)"
codename="$(lsb_release -cs)"
case "${codename}" in
  "bullseye")
    url="http://ftp.debian.org/debian/pool/main/c/cmake/cmake-data_${version}-1~bpo11+1_all.deb"
    hash="6c7c8d91c045ccf44c9cc7dc1f05d8431707df4651bf18b4a3ee34847bc205f3"
    ;;
  *)
    url="http://archive.ubuntu.com/ubuntu/pool/main/c/cmake/cmake-data_${version}-1ubuntu1_all.deb"
    hash="8633c1235e841faa70eb1c58f451338a73048dbddb4d97c482cca92dde61c567"
    ;;
esac
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"
repology=("project: cmake" "repo: debian_unstable")
