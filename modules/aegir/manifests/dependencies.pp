class aegir::dependencies {

  package {'drush':
    ensure => '4.5-2~bpo60+1',
  }

  package {'drush-make':
    ensure => present,
    require => [
      Package['drush'],
      Class['aegir::sources'],
    ],
  }

  package {'mysql-server' :
    ensure => present,
    responsefile => 'files/mysql-server.preseed',
  }

  package {'postfix' :
    ensure => present,
    responsefile => 'files/postfix.preseed',
  }

}
