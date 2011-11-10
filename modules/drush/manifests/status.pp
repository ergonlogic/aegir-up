class drush::status ($site_alias) {

  exec {"drush-status-${site_alias}":
    path        => '/usr/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush @${site_alias} status > /var/aegir/drush_status.txt",
    environment => "HOME=/var/aegir",
  }

}
