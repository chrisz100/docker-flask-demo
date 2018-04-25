#!/bin/bash
set -e

export PATH=$PATH:/home/myapp/.local/bin
exec "$@"
