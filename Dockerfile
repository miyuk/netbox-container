ARG NETBOX_VERSION=latest
FROM ghcr.io/netbox-community/netbox:${NETBOX_VERSION}

# Install NetBox plugins from requirements file
COPY plugin_requirements.txt /etc/netbox/plugin_requirements.txt
RUN /usr/local/bin/uv pip install --no-cache-dir -r /etc/netbox/plugin_requirements.txt

# Ensure plugin static assets are collected into /opt/netbox/netbox/static
COPY configuration/plugins.py /etc/netbox/config/plugins.build.py
RUN mv /etc/netbox/config/plugins.py /etc/netbox/config/plugins.py.bak && \
    cp /etc/netbox/config/plugins.build.py /etc/netbox/config/plugins.py
RUN DEBUG=true \
    SECRET_KEY=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa \
    /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic \
    --no-input --verbosity 2
RUN rm -f /etc/netbox/config/plugins.py && \
    mv /etc/netbox/config/plugins.py.bak /etc/netbox/config/plugins.py
