name="brave-browser-deb"
gives="brave-browser"
version="1.52.130"
breaks=("${gives}-bin" "${gives}-git" "${gives}-app")
url="https://github.com/brave/${gives}/releases/download/v${version}/${gives}_${version}_amd64.deb"
homepage='https://brave.com/'
description="Release version of world's most unique, privacy friendly web browser"
hash="4ca080bf580674053d28372bad110f8058d938f3704c07cbac2877dc301fe355"
arch=('amd64')
pacdeps=("brave-keyring-deb")
repology=("project: brave")
maintainer="Elsie19 <hwengerstickel@pm.me>"
