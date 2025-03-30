#!/bin/sh

# Ensure that the root key is anchored correctly
unbound-anchor -a /etc/unbound/root.key || { echo "unbound-anchor failed"; exit 1; }

# Check the Unbound configuration for errors
unbound-checkconf -q || { echo "unbound-checkconf failed"; exit 1; }

# Start Unbound in the foreground
exec unbound -p