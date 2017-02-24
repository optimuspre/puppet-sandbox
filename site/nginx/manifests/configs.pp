class nginx::configs {
  file { 'nginx.conf':
    path    => "${confdir}/nginx.conf",
    content => epp('nginx/nginx.conf.epp', {
      user     => $user,
      confdir  => $confdir,
      blockdir => $blockdir,
      logdir   => $logdir,
    }),
  }
  
  file { 'default.conf':
    path    => "${blockdir}/default.conf",
    content => epp('nginx/default.conf.epp', {
      docroot => $docroot,
      port    => $port,
    }),
  }
}
