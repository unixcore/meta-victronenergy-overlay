FILESEXTRAPATHS_prepend := "${THISDIR}/php:"

SRC_URI += " file://php-fpm.conf \
           "

DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
           libc-client openssl sqlite3"
           
PRINC := "${@int(PRINC) + 2}"

EXTRA_OECONF = "--enable-mbstring --enable-discard-path --enable-wddx \
                --enable-magic-quotes --enable-fastcgi --enable-fpm \
                --with-gettext=${STAGING_LIBDIR}/.. \
                --with-zlib --with-zlib-dir=${STAGING_LIBDIR}/.. \
                --with-iconv=${STAGING_LIBDIR}/.. \
                --with-libxml-dir=${STAGING_BINDIR_CROSS} \
                --disable-embedded-mysqli \
				--with-sqlite3=${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
                --with-pdo-sqlite=${STAGING_LIBDIR}/.. ${COMMON_EXTRA_OECONF} \
               "
               
do_install_append_php-fpm() {
    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
}

do_install_append_pn-php() {
    rm -rf ${D}/${TMPDIR}
    rm -rf ${D}/home	
    rm -rf ${D}/var
    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default  
}    

export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"

#PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
