FROM alpine:3.15

# Create 'unbound' user and install required packages
RUN adduser -D unbound && \
    apk add --no-cache unbound=1.13.2-r2  \
    openssl \
    bind-tools && \
    rm -f /etc/unbound/unbound.conf && \
    rm -f /etc/unbound/root.key && \
    mkdir -p /etc/unbound /usr/local/bin && \
    chown -R unbound:unbound /etc/unbound /usr/local/bin

# Copy custom scripts and configuration files
COPY scripts /usr/local/bin
COPY config /etc/unbound

# Set the correct permissions for the entrypoint script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set working directory
WORKDIR /etc/unbound

# Run as non-root 'unbound' user
USER unbound

# Define entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]