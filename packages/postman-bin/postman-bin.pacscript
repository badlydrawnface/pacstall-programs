name="postman-bin"
version="10.15.0"
description="Build, test, and document your APIs faster"
repology=("project: postman" "visiblename: postman-bin")
url="https://dl.pstmn.io/download/version/${version}/linux64"
hash="b2f93ad0ae29661d2a45dc7dfb93944eed318065cc86abd04c64dc9aa04e32af"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="postman"
breaks=("postman" "postman-deb" "postman-app")
depends=("libxss1" "libnss3" "libgtk-3-0")

install() {
  # Get desktop file and install it
  wget -q "https://aur.archlinux.org/cgit/aur.git/plain/postman.desktop?h=postman-bin" -O postman.desktop
  sudo install -Dm644 postman.desktop -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  sudo install -d "${pkgdir}/opt/postman/" "${pkgdir}/usr/bin"
  sudo install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

  sudo cp -r "${SRCDIR}/Postman/app/"* "${pkgdir}/opt/postman/"
  sudo chmod +x "${pkgdir}/opt/postman/postman"
}

postinst() {
  sudo ln -s -r "/opt/postman/resources/app/assets/icon.png" "/usr/share/icons/hicolor/128x128/apps/postman.png"
  sudo ln -s -r "/opt/postman/Postman" "/usr/bin/postman"
}

removescript() {
  sudo rm -f "/usr/share/icons/hicolor/128x128/apps/postman.png"
  sudo rm -f "/usr/bin/postman"
}
