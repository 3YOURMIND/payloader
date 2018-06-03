#!/bin/bash -e
# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.6.1
# ARG_OPTIONAL_SINGLE([header], h, [a file to use as header], 'install.sh.in')
# ARG_OPTIONAL_BOOLEAN([binary], b, [should we append binary payload (and implicit default: off)])
# ARG_POSITIONAL_SINGLE([payload], [ a random file for payload], [])
# ARG_DEFAULTS_POS
# ARGBASH_SET_INDENT([  ])
# ARGBASH_GO

# [ <-- needed because of Argbash`
if test "$_arg_binary" = 'on'
then
  sed \
    -e 's/uuencode=./uuencode=0/' \
    -e 's/binary=./binary=1/' \
                         $_arg_header > ${_arg_payload}.sh
  echo "PAYLOAD:" >> ${_arg_payload}.sh
        cat $_arg_payload >> ${_arg_payload}.sh
fi

if test $_arg_binary = 'off'
then
  sed \
    -e 's/uuencode=./uuencode=1/' \
    -e 's/binary=./binary=0/' \
        $_arg_header >${_arg_payload}.sh
  echo "PAYLOAD:" >> ${_arg_payload}.sh
  cat $_arg_payload | uuencode - >> ${_arg_payload}.sh
fi

# ] <-- needed because of Argbash
