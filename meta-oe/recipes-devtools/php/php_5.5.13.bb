require php.inc

LIC_FILES_CHKSUM = "file://LICENSE;md5=5bb09683f8f09b15b7076f4b4c31d61f"

PR = "${INC_PR}.0"

SRC_URI += " \
		file://acinclude-xml2-config.patch \
		file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
		file://0001-brutal-hack-to-make-cross-compiling-work-for-linux.patch \
		file://0001-workaround-dlopen-not-correctly-polled.patch \
		file://0001-AC_TRY_RUN-won-t-work-when-cross-compiling.patch \
	"

SRC_URI_append_pn-php += "file://iconv.patch \
            file://pear-makefile.patch \
            file://phar-makefile.patch \
            file://php_exec_native.patch \
            file://php-fpm.conf \
            file://php-fpm-apache.conf \
"

SRC_URI[md5sum] = "e26e90af25ee6505dc18855e0180ffe9"
SRC_URI[sha256sum] = "e58a4a754eb18d2d8b1a120cad5cce4ed24a7db5d49eca5830a40e4c8ca78b9c"
