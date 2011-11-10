class aegir::contrib {

  drush::dl { ['hosting_platform_pathauto',
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
    cwd        => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
    require    => Class['aegir'],
  }

  drush::en { ['hosting_platform_pathauto',
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
    cwd        => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
    require    => Class['aegir'],
  }

  drush::dis { ['sitedir_migrate',
               ]:
    site_alias => '@hostmaster',
    cwd        => "/var/aegir/hostmaster-6.x-1.5/sites/aegir.local",
    require    => Class['aegir'],
  }

}
