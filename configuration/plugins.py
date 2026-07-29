# from os import environ
# from netbox_branching.utilities import DynamicSchemaDict
PLUGINS = [
    "netbox_custom_objects",
    "netbox_security",
    "netbox_topology_views",
    "netbox_dns",
    # "netbox_branching",
    "netbox_diode_plugin",
    "netbox_acls",
    "netbox_bgp",
    "netbox_qrcode",
    "netbox_secrets",
]

# PLUGINS_CONFIG = {
#     "netbox_branching": {
#         "exempt_models": [
#             "netbox_custom_objects.customobjecttype",
#             "netbox_custom_objects.customobjecttypefield",
#         ],
#     },
# }

# DATABASES = DynamicSchemaDict({
#     'default': {
#         'NAME': environ.get('DB_NAME', 'netbox'),
#         'USER': environ.get('DB_USER', ''),
#         'PASSWORD': environ.get('DB_PASSWORD', ''),
#         'HOST': environ.get('DB_HOST', 'localhost'),
#         'PORT': environ.get('DB_PORT', ''),
#         'OPTIONS': {'sslmode': environ.get('DB_SSLMODE', 'prefer')},
#         'CONN_MAX_AGE': int(environ.get('DB_CONN_MAX_AGE', '300')),
#         'DISABLE_SERVER_SIDE_CURSORS': environ.get('DB_DISABLE_SERVER_SIDE_CURSORS', 'False').lower() == 'true',
#     }
# })

# DATABASE_ROUTERS = [
#     'netbox_branching.database.BranchAwareRouter',
# ]