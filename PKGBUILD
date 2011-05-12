# Contributor: Thomas Battermann <archlinux@thomasba.de>
# PKGBUILD for ArchLinux

pkgname=paste42
pkgver=20110512.1
pkgrel=1
pkgdesc="Utility to post text files to paste42.de using curl"
arch=('i686' 'x86_64')
url="http://paste42.de/"
license=('GPL')
depends=('curl' 'bash')
makedepends=('git')
source=()

_gitroot="git://thomasba.de/paste42.git"
_gitname="paste42"

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
		cd ${_gitname}
	fi

	msg "GIT checkout done or server timeout"

	install -D -m755 ${_gitname}.sh ${pkgdir}/usr/bin/${_gitname} || return 1
}
