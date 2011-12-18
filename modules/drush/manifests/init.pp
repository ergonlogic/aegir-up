class drush {

  include drush::preferences

  package { 'drush':
    ensure  => latest,
    require => [
      Class['drush::preferences'],
    ],
  }

}

class drush::preferences {

  apt::sources {'drush.list':
    dir  => '/tmp/vagrant-puppet/modules-0/drush/files',
    name => 'drush',
  }


  file {'/etc/apt/preferences.d/drush.pref':
    ensure => present,
    source => "/tmp/vagrant-puppet/modules-0/drush/files/drush.pref",
  }

}
