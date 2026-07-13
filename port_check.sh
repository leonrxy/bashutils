#!/bin/bash
# Check if a port is in use
# Usage: ./port_check.sh <port>

port="${1:-8080}"
if ss -tuln | grep -q ":$port "; then
    echo "Port $port is IN USE"
    ss -tuln | grep ":$port "
else
    echo "Port $port is available"
fi
