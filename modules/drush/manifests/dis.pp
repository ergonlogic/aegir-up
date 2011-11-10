define drush::dis ($site_alias = "", $cwd = "/var/aegir") {

  exec {"drush-dis-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush ${site_alias} dis ${name} -y >> /var/aegir/drush.log 2>&1",
    environment => "HOME=/var/aegir",
    cwd         => $cwd,
  }
                          
}
