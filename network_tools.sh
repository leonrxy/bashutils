#!/bin/bash
# Network diagnostic utilities
# Tools for quick network troubleshooting

check_connectivity() {
  local host="${1:-8.8.8.8}"
  ping -c 1 -W 3 "$host" &>/dev/null
  return $?
}

get_public_ip() {
  curl -s --max-time 5 https://api.ipify.org || curl -s --max-time 5 https://ifconfig.me
}

check_port() {
  local host="$1" port="$2"
  (echo >/dev/tcp/"$host"/"$port") 2>/dev/null
  return $?
}

dns_lookup() {
  local domain="$1"
  dig +short "$domain" 2>/dev/null || nslookup "$domain" 2>/dev/null | grep "Address" | tail -1
}

traceroute_summary() {
  traceroute -n -m 15 -q 1 "$1" 2>/dev/null | awk "NR>1 {print \$1, \$2}"
}

http_status() {
  curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$1"
}

check_ssl() {
  echo | openssl s_client -servername "$1" -connect "$1":443 2>/dev/null | openssl x509 -noout -dates
}