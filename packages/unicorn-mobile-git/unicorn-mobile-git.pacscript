name="unicorn-mobile-git"
url="https://github.com/oklopfer/unicorn.git"
depends=("xfwm4" "xfdashboard" "xfdashboard-plugins" "plank" "dconf-cli" "yaru-theme-icon" "yaru-theme-gtk" "papirus-icon-theme" "onboard" "xfce4-helpers" "xiccd" "xfce4" "dbus-x11" "hardinfo")
pacdeps=("lightpad-git" "papirus-folders" "ulauncher-deb")
gives="unicorn-mobile"
replace=("rhino-xfce4-mobile-config-git" "rhino-linux-xfce4-config-git" "unicorn-desktop" "unicorn-desktop-git")
description="Unicorn Desktop Mobile variant by the Rhino Linux Team"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"
incompatible=("debian:*")

build() {
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds"
  sudo mkdir -p "${pkgdir}/usr/share/doc"
  sudo mkdir -p "${pkgdir}/etc/skel/.config"
  sudo mkdir -p "${pkgdir}/usr/share/icons"
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds/xfce"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  sudo mkdir -p "${pkgdir}/usr/share/plank/themes"
  sudo mkdir -p "${pkgdir}/usr/share/onboard"
  sudo mkdir -p "${pkgdir}/etc/skel/.lightpad"
  sudo mkdir -p "${pkgdir}/etc/skel/.local/share"
  sudo mkdir -p "${pkgdir}/etc/xdg/xdg-unicorn/xfce4"
  sudo mkdir -p "${pkgdir}/usr/share/xsessions"
  sudo mkdir -p "${pkgdir}/usr/share/lightdm/lightdm.conf.d"
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/places"
}

install() {
  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  # Install
  for i in xfce4 plank autostart ulauncher; do
    sudo cp -r "${i}" "${pkgdir}/etc/skel/.config"
  done
  sudo install -Dm755 "startunicorn" -t "${pkgdir}/usr/bin"
  sudo install -Dm755 "unicorn-session" -t "${pkgdir}/usr/bin"
  sudo install -Dm755 ".xinitrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  sudo install -Dm755 "xinitrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  sudo cp -r failsafe/xfce4/* "${pkgdir}/etc/xdg/xdg-unicorn/xfce4"
  sudo install -Dm644 "unicorn.desktop" -t "${pkgdir}/usr/share/xsessions"
  sudo install -Dm644 "60-unicorn.conf" -t "${pkgdir}/usr/share/lightdm/lightdm.conf.d"
  sudo cp -r rhino "${pkgdir}/usr/share/backgrounds/"
  sudo cp -r rhinoplank "${pkgdir}/usr/share/plank/themes"
  sudo cp docks.ini "${pkgdir}/usr/share/plank/"
  sudo cp onboard.ini "${pkgdir}/usr/share/onboard"
  sudo cp rhino/* "${pkgdir}/usr/share/backgrounds/xfce"
  sudo cp icons/* "${pkgdir}/usr/share/icons"
  sudo cp applications/* "${pkgdir}/usr/share/applications"
  sudo cp lightpad/* "${pkgdir}/etc/skel/.lightpad"
  sudo install -Dm644 "unicorn_badge-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/places"
  sudo install -Dm644 "logo.png" -t "${pkgdir}/usr/share/icons"
  sudo install -Dm644 "logo.svg" -t "${pkgdir}/usr/share/icons"
  sudo cp -r onboard "${pkgdir}/etc/skel/.local/share"
  sudo cp -r Dot-Transparent "${pkgdir}/usr/share/icons"
}

postinst() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  for i in plank autostart ulauncher; do
    cp -r "/etc/skel/.config/${i}" "${homedir}/.config"
    sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/${i}"
  done
  if ! [[ -d "${homedir}/.lightpad" ]]; then
    mkdir -p "${homedir}/.lightpad"
  fi
  cp /etc/skel/.lightpad/* "${homedir}/.lightpad"
  papirus-folders -C violet --theme Papirus-Dark
  if ! [[ -d "${homedir}/.local/share" ]]; then
    mkdir -p "${homedir}/.local/share"
  fi
  cp -r "/etc/skel/.local/share/onboard" "${homedir}/.local/share"
}
