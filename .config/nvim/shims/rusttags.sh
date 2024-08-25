#!/bin/sh

_tmp=`getopt -o f: --long options:,exclude: -n "rusttags" -- "$@"`
eval set -- "$_tmp"

while true; do
  case "$1" in
    -f ) _output_file="${2}"; shift 2 ;;
    --options ) shift 2 ;;
    --exclude ) shift 2 ;;
    * ) break ;;
  esac
done

if [ ! -n "${_output_file}" ]; then
  echo "-f option not provided"
  exit 1
fi

echo "-f set to: ${_output_file}"

rusty-tags --output "${_output_file}" vi
