class apt::update {

  exec { 'apt_update':
    command => '/usr/bin/apt-get update && /usr/bin/apt-get autoclean',
#    require => [ Config_file['/etc/apt/sources.list'] ],
  }

}
