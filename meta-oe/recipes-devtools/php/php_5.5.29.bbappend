PACKAGECONFIG="sqlite3"
PRINC := "${@int(PRINC) + 2}"

# Needed for vrmportal package to retrieve all the dependencies during compile
# on the host (!).
COMMON_EXTRA_OECONF = "--with-openssl"