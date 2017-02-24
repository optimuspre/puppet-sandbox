class nginx::package {
  $pkgs = [
    'nginx-filesystem',
    'nginx-mod-mail',
    'nginx-mod-http-geoip',
    'nginx',
    'nginx-all-modules',
    'nginx-mod-http-perl',
    'nginx-mod-stream',
    'nginx-mod-http-image-filter',
    'nginx-mod-http-xslt-filter',
  ]

  package { $pkgs:
    ensure => present,
  }
}
