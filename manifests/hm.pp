# A Puppet manifest to provision an Aegir Hostmaster server

import "base.pp"
import "settings.pp"

file { '/etc/motd':
  content => "Welcome to your Aegir Hostmaster virtual machine!
              Built by Vagrant. Managed by Puppet.\n"
}

class aegir-repo {
  file { 'aegir.list':
    path => '/etc/apt/sources.list.d/aegir.list',
    content => 'deb http://debian.aegirproject.org/ squeeze main
deb-src http://debian.aegirproject.org/ squeeze main',
  }
  exec { 'get key':
    command => "/usr/bin/wget -nc -P /tmp/vagrant-puppet/manifests/files/ http://debian.aegirproject.org/key.asc",
    unless => "/bin/ls /tmp/vagrant-puppet/manifests/files/| /bin/grep 'key.asc'",
  }
  exec { 'add key':
    command => "/usr/bin/apt-key add /tmp/vagrant-puppet/manifests/files/key.asc",
  }
  exec { 'aegir-update':
    command => "/usr/bin/apt-get update",
  }
  File['aegir.list'] -> Exec['get key'] -> Exec['add key'] -> Exec['aegir-update']
}

class {'aegir-repo': }

# dependencies
package { 'drush': 
  ensure => $drush_version,
  require => Exec['apt-update'],
}
#package { 'mysql-server' :
#  ensure => present,
#  responsefile => '/tmp/vagrant-puppet/manifests/files/mysql-server.preseed',
#}
#package { 'postfix' :
#  ensure => present,
#  responsefile => '/tmp/vagrant-puppet/manifests/files/postfix.preseed',
#}
#exec { 'db_password1' : command => "/usr/bin/debconf-set-selections 'aegir-hostmaster aegir/db_password password PASSWORD'", }
#exec { 'db_password2' : command => "/usr/bin/debconf-set-selections 'aegir-hostmaster aegir/db_password seen true'", }
#exec { 'db_host' : command => "/usr/bin/debconf-set-selections 'aegir-hostmaster aegir/db_host string localhost'", }
#exec { 'aegir_email' : command => "/usr/bin/debconf-set-selections 'aegir-hostmaster aegir/email string %s'", }
#exec { 'aegir_site' : command => "/usr/bin/debconf-set-selections 'aegir-hostmaster aegir/site string %s'", }
#exec { 'aegir_makefile' : command => "/usr/bin/debconf-set-selections 'aegir-hostmaster aegir/makefile string http://drupalcode.org/project/provision.git/blob_plain/6.x-1.x:/aegir.make'", }
#exec { 'env1' : command => "/usr/bin/env DPKG_DEBUG=developer", }
#exec { 'env2' : command => "/usr/bin/env DEBIAN_FRONTEND=noninteractive", }
#exec { 'env3' : command => "/usr/bin/env DEBUG=yes", }

  # Install aegir, but ensure that no questions are prompted.
#exec { 'aegir-install' : 
#  command => "/usr/bin/env DPKG_DEBUG=developer /usr/bin/env DEBIAN_FRONTEND=noninteractive /usr/bin/env DEBUG=yes /usr/bin/apt-get install aegir -y", 
#  require => [
#    Package['debconf-utils'], 
#    Package['mysql-server'],
#    Package['postfix'],
#    Package['drush'],
#    Exec['apt-update'],
#    Exec['db_password1'],
#    Exec['db_password2'],
#    Exec['db_host'],
#    Exec['aegir_email'],
#    Exec['aegir_site'],
#    Exec['aegir_makefile'],
#    Exec['env1'],
#    Exec['env2'],
#    Exec['env3'],
#  ],
#}

#package { 'aegir':
#  ensure => present,
#  responsefile => '/tmp/vagrant-puppet/manifests/files/aegir.preseed',
#  require => [
#    Package['debconf-utils'], 
#    Package['mysql-server'],
#    Package['postfix'],
#    Package['drush'],
#    Exec['apt-update'],
#  ],
#}


