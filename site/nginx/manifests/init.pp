class nginx (
  $package  = $nginx::params::package,
  $owner    = $nginx::params::owner,
  $group    = $nginx::params::group,
  $docroot  = $nginx::params::docroot,
  $confdir  = $nginx::params::confdir,
  $blockdir = $nginx::params::blockdir,
  $logdir   = $nginx::params::logdir,
  $port     = $nginx::params::port,
  $user     = $nginx::params::user,
) inherits nginx::params {
    
  File {
    ensure => file,
    owner  => $owner,
    group  => $group,
    mode   => '0644',
  }
  
  include nginx::package
  include nginx::configs
  include nginx::services
  
  file { 'docroot':
    ensure => directory,
    path   => $docroot,
  }
  
  file { 'index.html':
    path    => "${docroot}/index.html",
    content => epp('nginx/index.html.epp', {
      fqdn => $::fqdn,
    }),
  }
}
