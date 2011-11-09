define drush::make ($makefile, $options="", $platforms_dir="/var/aegir/platforms", $makefiles_dir="/var/aegir/makefiles") {

  exec {"drush-make-${name}":
    path        => '/usr/bin:/bin',
    user        => 'aegir',
    group       => 'aegir',
    command     => "drush make ${makefiles_dir}/${makefile} ${platforms_dir}/${name} -y ${options} >> /var/aegir/drush.log 2>&1",
    creates     => "${platforms_dir}/${name}",
    environment => "HOME=/var/aegir",
  }
                          
}
