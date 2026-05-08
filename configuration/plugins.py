PLUGINS = [
    'netbox_bgp',
    'netbox_topology_views',
]

PLUGINS_CONFIG = {
    'netbox_bgp': {},
    'netbox_topology_views': {
        # preselected_device_roles must be a comma-separated string (not a list)
        'preselected_device_roles': 'Server,Top of Rack Switch,Leaf Switch,Spine Switch',
        'allow_coordinates_saving': True,
        'always_save_coordinates': True,
    },
}
