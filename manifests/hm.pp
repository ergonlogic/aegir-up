# A Puppet manifest to provision an Aegir Hostmaster server

group { 'puppet': ensure => present, }

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your Aegir Hostmaster virtual machine!
              Built by Vagrant. Managed by Puppet.\n
              Developed and maintained by Ergon Logic Enterprises.\n"
}

include aegir

include drush

#class {'drush::status':
#  site_alias => 'hostmaster',
#  require => Class['aegir'],
#}

#class {'aegir::contrib': }
#class {'aegir::queue_runner': }

#aegir::platform {'Open_Atrium22':
#  makefile => 'http://drupalcode.org/sandbox/ergonlogic/1237618.git/blob_plain/HEAD:/stub-openatrium.make',
#}
