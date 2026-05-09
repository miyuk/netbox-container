ARG NETBOX_VERSION=latest
FROM ghcr.io/netbox-community/netbox:${NETBOX_VERSION}

USER root

# Install NetBox plugins from requirements file
COPY plugin_requirements.txt /tmp/plugin_requirements.txt
RUN /usr/local/bin/uv pip install --no-cache-dir -r /tmp/plugin_requirements.txt \
    && rm /tmp/plugin_requirements.txt

USER unit

# Copy plugin configuration
COPY configuration/plugins.py /etc/netbox/config/plugins.py
