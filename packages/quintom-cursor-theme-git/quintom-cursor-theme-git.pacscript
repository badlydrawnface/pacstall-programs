name="quintom-cursor-theme-git"
gives="quintom-cursor-theme"
url="https://gitlab.com/Burning_Cube/quintom-cursor-theme.git"
description="A cursor theme designed to look decent"
maintainer="Elsie19 <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

package() {
  sudo mkdir -p "${pkgdir}/usr/share/icons"
  sudo cp -r 'Quintom_Ink Cursors/Quintom_Ink' "${pkgdir}/usr/share/icons"
  sudo cp -r 'Quintom_Snow Cursors/Quintom_Snow' "${pkgdir}/usr/share/icons"
}
