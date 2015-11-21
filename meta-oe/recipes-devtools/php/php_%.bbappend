PACKAGECONFIG = "sqlite3"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# note: PRINC is needed in danny/ccgx
PRINC ?= "666000"
PRINC := "${@int(PRINC) + 1}"

SRC_URI += " \
		file://0001-workaround-dlopen-not-correctly-polled.patch \
		file://0001-AC_TRY_RUN-won-t-work-when-cross-compiling.patch \
	"
