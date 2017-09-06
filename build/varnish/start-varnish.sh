#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -F \
  -f $VCL_CONFIG \
  -s malloc,$CACHE_SIZE \
  $VARNISHD_PARAMS"


# varnishd -F -f /etc/varnish/default.vcl -p esi_syntax=0x2 -p cli_buffer=16384 -p feature=+esi_ignore_other_elements
# varnishd -F -f /etc/varnish/default.vcl -s malloc,$CACHE_SIZE -a 0.0.0.0:99
# varnishd -F -f /etc/varnish/default.vcl -s malloc,$CACHE_SIZE -a -p cli_buffer=16384 -p feature=+esi_ignore_other_elements 0.0.0.0:99
