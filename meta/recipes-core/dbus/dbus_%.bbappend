FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://dbus-daemon-watch.sh"

RDEPENDS_${PN} = "inotify-tools"

do_install_append() {
    install ${WORKDIR}/dbus-daemon-watch.sh ${D}${bindir}/dbus-daemon-watch.sh
}
