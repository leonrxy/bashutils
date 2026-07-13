#!/bin/bash
# Quick HTTP server in current directory
# Usage: ./quick_server.sh [port]

port="${1:-8000}"
echo "Serving $(pwd) on http://localhost:$port"
python3 -m http.server "$port"
