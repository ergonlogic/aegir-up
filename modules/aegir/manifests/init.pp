class aegir {

include sources
include dependencies

  package { 'aegir':
    ensure => present,
    responsefile => 'files/aegir.preseed',
    require => [
      Class['aegir::sources'],
      Class['aegir::dependencies'],
    ],
  }

}
