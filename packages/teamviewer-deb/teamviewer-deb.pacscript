name="teamviewer-deb"
pkgname="teamviewer"
gives="teamviewer"
version="15.43.6"
repology=("project: teamviewer")
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
depends=("libqt5x11extras5" "libqt5quickcontrols2-5" "libqt5webengine5" "libqt5svg5" "hicolor-icon-theme")
url="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
description="Application for remote desktop sharing and online meetings"
license="custom"
hash="ccfefcacbdebffb33af9c64db9786ebeaddbde1b90a26cb6c1638c77054d449c"
arch=('amd64')
maintainer="heyzsh <haidarzsh@gmail.com>"
