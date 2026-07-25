ARG NETBOX_VERSION=latest
FROM ghcr.io/netbox-community/netbox:${NETBOX_VERSION}

# Install NetBox plugins from requirements file
COPY plugin_requirements.txt /etc/netbox/plugin_requirements.txt
COPY configuration/plugins.py /etc/netbox/config/plugins.py
RUN /usr/local/bin/uv pip install --no-cache-dir -r /etc/netbox/plugin_requirements.txt \
    && rm /tmp/plugin_requirements.txt

# Ensure plugin static assets are collected into /opt/netbox/netbox/static
RUN SECRET_KEY=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
