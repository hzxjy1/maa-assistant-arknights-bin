#https://github.com/hzxjy1/maa-assistant-arknights-bin

pkgname=maa-assistant-arknights-bin
_pkgver=v4.19.2
pkgver="$(echo ${_pkgver//-/} | sed -e 's/^v//')"
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
depends=(opencv onnxruntime-bin onnxruntime cpr)
conflicts=('maa-assistant-arknights')
source=("$url/releases/download/${_pkgver}/MAA-${_pkgver}-linux-x86_64.tar.gz")
md5sums=('9499f65a98f5612ea9644053eb71215c')

package() {
    cd "${srcdir}"

    install -Dm755 libMaaCore.so "${pkgdir}/usr/lib/libMaaCore.so"
    install -Dm755 libMaaDerpLearning.so "${pkgdir}/usr/lib/libMaaDerpLearning.so"

    install -Dm644 AsstCaller.h "${pkgdir}/usr/include/AsstCaller.h"
    install -Dm644 AsstPort.h "${pkgdir}/usr/include/AsstPort.h"

    install -d "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/Python" "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/resource" "${pkgdir}/usr/share/${pkgname}"
}