#https://github.com/hzxjy1/maa-assistant-arknights-bin

pkgname=maa-assistant-arknights-bin
_pkgver=v4.20.0
pkgver="$(echo ${_pkgver//-/} | sed -e 's/^v//')"
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
conflicts=('maa-assistant-arknights')
source=("$url/releases/download/${_pkgver}/MAA-${_pkgver}-linux-x86_64.tar.gz")
md5sums=('1ea1013f5561bf20b33cc67199233f5a')

package() {
    cd "${srcdir}"

    install -Dm755 libMaaCore.so "${pkgdir}/usr/lib/libMaaCore.so"
    install -Dm755 libMaaDerpLearning.so "${pkgdir}/usr/lib/libMaaDerpLearning.so"
    install -Dm755 libopencv_world4.so.407 "${pkgdir}/usr/lib/libopencv_world4.so.407"
    install -Dm755 libonnxruntime.so.1.14.1 "${pkgdir}/usr/lib/libonnxruntime.so.1.14.1"

    install -Dm644 AsstCaller.h "${pkgdir}/usr/include/AsstCaller.h"
    install -Dm644 AsstPort.h "${pkgdir}/usr/include/AsstPort.h"

    install -d "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/Python" "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/resource" "${pkgdir}/usr/share/${pkgname}"
}
