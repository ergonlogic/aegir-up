class aegir::dependencies {

  include drush

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
