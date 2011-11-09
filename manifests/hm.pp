# A Puppet manifest to provision an Aegir Hostmaster server

file { '/etc/motd':
  content => "Welcome to your Aegir Hostmaster virtual machine!
              Built by Vagrant. Managed by Puppet.\n
              Developed and maintained by Ergon Logic Enterprises.\n"
}

include aegir

include drush

class {'drush::status':
  site_alias => 'hostmaster',
  require => Class['aegir'],
}

#class {'aegir::contrib' :}
class {'aegir::queue_runner' :}
