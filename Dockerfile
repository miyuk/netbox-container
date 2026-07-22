ARG NETBOX_VERSION=latest
FROM ghcr.io/netbox-community/netbox:${NETBOX_VERSION}

USER root

# Install NetBox plugins from requirements file
COPY plugin_requirements.txt /tmp/plugin_requirements.txt
RUN /usr/local/bin/uv pip install --no-cache-dir -r /tmp/plugin_requirements.txt \
    && rm /tmp/plugin_requirements.txt

# Ensure plugin static assets are collected into /opt/netbox/netbox/static
RUN SECRET_KEY=dummy /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

USER unit
