class skeleton {
  file { 'skel':
    ensure => directory,
    path   => '/etc/skel',
    owner  => 'root',
    group  => 'root',
  }
  
  file { 'bashrc':
    ensure => file,
    path   => '/etc/skel/.bashrc',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/skeleton/bashrc',
  }
}
