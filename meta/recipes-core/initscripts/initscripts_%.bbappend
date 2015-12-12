FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://datadir.sh"

do_install_append () {
	install -m 0755 ${WORKDIR}/datadir.sh ${D}${sysconfdir}/init.d
	# sometime after checkroot.sh but before syslog starts 
	update-rc.d -r ${D} datadir.sh start 10 S .
}
