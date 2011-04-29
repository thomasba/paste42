# Contributor: Thomas Battermann <archlinux@thomasba.de>
# PKGBUILD for ArchLinux

pkgname=paste42
pkgver=20110429
pkgrel=1
pkgdesc="Utility to post text files to paste42.de using curl"
arch=('i686' 'x86_64')
url="http://paste42.de/"
license=('GPL')
depends=('curl' 'bash')
source=("http://paste42.de/paste42.sh")
md5sums=('c0e08a4dbdca666cff77d9fa10fda7bd')
sha1sums=("5f73caf9cb36f65c8e192050ec7a4a5c7e19d8bc")
 
build() {
	install -D -m755 paste42.sh ${pkgdir}/usr/bin/paste42 || return 1
}
