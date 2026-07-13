#!/bin/bash
# String manipulation utilities
# Provides common string operations for bash scripts

to_upper() { echo "${1^^}"; }
to_lower() { echo "${1,,}"; }
trim() { echo "$1" | sed "s/^[[:space:]]*//;s/[[:space:]]*$//"; }
reverse() { echo "$1" | rev; }
count_chars() { echo -n "$1" | wc -c; }
contains() { [[ "$1" == *"$2"* ]] && return 0 || return 1; }
replace_all() { echo "${1//$2/$3}"; }
repeat() { printf "%.0s$1" $(seq 1 "$2"); }
slugify() { echo "$1" | tr "[:upper:]" "[:lower:]" | sed "s/[^a-z0-9]/-/g" | sed "s/--*/-/g" | sed "s/^-//;s/-$//"; }
capitalize() { echo "$(echo ${1:0:1} | tr "[:lower:]" "[:upper:]")${1:1}"; }

# Example usage:
# to_upper "hello" -> "HELLO"
# slugify "Hello World!" -> "hello-world"