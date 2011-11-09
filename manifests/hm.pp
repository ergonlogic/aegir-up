# A Puppet manifest to provision an Aegir Hostmaster server

file { '/etc/motd':
  content => "Welcome to your Aegir Hostmaster virtual machine!
              Built by Vagrant. Managed by Puppet.\n
              Developed and maintained by Ergon Logic Enterprises.\n"
}

include aegir

include drush

class {'drush::status':
  site_alias => 'hostmaster',
  require => Class['aegir'],
}

drush::dl { ['hosting_queue_runner',
             'hosting_platform_pathauto',
             'hosting_backup_queue',
             'hosting_backup_gc',
             'hosting_upload',
             'hosting_server_titles',
             'aegir_rules',
             #'hosting_advanced_cron',
             'hosting_notifications',
             #'provision_boost',
             'sitedir_migrate',
            ]:
  site_alias => '@hostmaster',
  cwd => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
  require => Class['aegir'],
}

drush::en { ['hosting_queue_runner',
             'hosting_platform_pathauto',
             'hosting_backup_queue',
             'hosting_backup_gc',
             'hosting_upload',
             'hosting_server_titles',
             'aegir_rules',
             #'hosting_advanced_cron',
             #'hosting_notifications',
             #'provision_boost',
             'sitedir_migrate',
            ]:
  site_alias => '@hostmaster',
  cwd => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
  require => Class['aegir'],
}

drush::dis { ['sitedir_migrate',
             ]:
  site_alias => '@hostmaster',
  cwd => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
  require => Class['aegir'],
}

