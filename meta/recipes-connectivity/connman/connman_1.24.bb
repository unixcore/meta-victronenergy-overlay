require connman.inc

SRC_URI  = "https://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.xz \
            file://0001-ntp-max-poll-set-to-16.patch \
            file://0001-Add-set-hwclock-when-time-is-decoded.patch \
            file://gweb-multi-header-workaround.patch \
            file://main.conf \
            file://connman \
            file://connmand-watch.sh \
           "

SRC_URI[md5sum] = "dd6e1b4d9b9a28d127edb9f9b58bdec1"
SRC_URI[sha256sum] = "551df7a5f0c6e4d69523dd2b3aa2c54525b323457d5135f64816215bad3dc24c"

PR = "${INC_PR}.0"

RCONFLICTS_${PN} = "ntpdate ntp-utils"
RREPLACES = "${RCONFLICTS_${PN}}"

do_install_append() {
	install -d ${D}${sysconfdir}/connman
	install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman/main.conf
}

pkg_postinst_${PN}() {
	if test "x$D" == "x"; then
		# Remove ntp cronjob
		echo "Removing ntpdate-sync cronjob"
		croncmd="/usr/bin/ntpdate-sync"
		( crontab -l | grep -v "$croncmd" ) | crontab -
	fi
}

