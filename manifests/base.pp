# Basic Puppet manifest to provision shared packages

group { 'puppet': ensure => present, }

File { owner => 0, group => 0, mode => 0644 }

include apt

class {'apt::update': }

class base_packages {
  package { 'git': ensure => present, }
  package { 'vim': ensure => present, }
  package { 'htop': ensure => present, }
  package { 'strace': ensure => present, }
  package { 'apt-show-versions': ensure => present, }
  package { 'debconf-utils': ensure => present, }
  package { 'dnsutils': ensure => present }
}

class { 'base_packages':
  require => Class['apt::update'],
}

file { '/root/.profile':
  ensure => present,
  source => "/tmp/vagrant-puppet/manifests/files/root.profile",
}

