INITSCRIPT_NAME = "svscanboot.sh"
INITSCRIPT_PARAMS = "start 30 5 2 ."
inherit update-rc.d

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append += "file://svscanboot.sh"

do_install_append() {
	mkdir -p ${D}/${sysconfdir}/init.d
        install -D ${WORKDIR}/svscanboot.sh ${D}/${sysconfdir}/init.d
}

