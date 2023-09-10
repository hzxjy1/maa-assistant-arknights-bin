#https://github.com/hzxjy1/maa-assistant-arknights-bin

pkgname=maa-assistant-arknights-bin
_pkgver=v4.23.3
pkgver="$(echo ${_pkgver//-/} | sed -e 's/^v//')"
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
conflicts=('maa-assistant-arknights')
source=("$url/releases/download/${_pkgver}/MAA-${_pkgver}-linux-x86_64.tar.gz")
md5sums=('222227111567d37c453e905e2f03a5b3')

package() {
    cd "${srcdir}"

    onn=$(ls libonnxruntime.so*)
    opencv=$(ls libopencv_world4.so*)

    install -Dm755 libMaaCore.so "${pkgdir}/usr/lib/libMaaCore.so"
    install -Dm755 libMaaDerpLearning.so "${pkgdir}/usr/lib/libMaaDerpLearning.so"
    install -Dm755 "${opencv}" "${pkgdir}/usr/lib/${opencv}"
    install -Dm755 "${onn}" "${pkgdir}/usr/lib/${onn}"

    install -Dm644 AsstCaller.h "${pkgdir}/usr/include/AsstCaller.h"
    install -Dm644 AsstPort.h "${pkgdir}/usr/include/AsstPort.h"

    install -d "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/Python" "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/resource" "${pkgdir}/usr/share/${pkgname}"
}
