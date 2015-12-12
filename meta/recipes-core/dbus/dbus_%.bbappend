FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://dbus-daemon-watch.sh \
	file://system.conf \
 "

RDEPENDS_${PN} = "inotify-tools"

do_install_append() {
    install ${WORKDIR}/dbus-daemon-watch.sh ${D}${bindir}/dbus-daemon-watch.sh
    install -m 0644 ${WORKDIR}/system.conf ${D}${sysconfdir}/dbus-1/system.conf
}
