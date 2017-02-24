class nginx::params {
  case $::os['family'] {
    'redhat', 'debian' : {
      $package  = 'nginx'
      $owner    = 'root'
      $group    = 'root'
      $docroot  = '/var/www'
      $confdir  = '/etc/nginx'
      $blockdir = '/etc/nginx/conf.d'
      $logdir   = '/var/log/nginx'
      $port     = '80'
    }
    'windows' : {
      $package  = 'nginx-service'
      $owner    = 'Administrator'
      $group    = 'Administrators'
      $docroot  = 'C:/ProgramData/nginx/html'
      $confdir  = 'C:/ProgramData/nginx'
      $blockdir = 'C:/ProgramData/nginx/conf.d'
      $logdir   = 'C:/ProgramData/nginx/logs'
      $port     = '80'
    }
    'default': { fail("Module ${module_name} is not a supported ${::os['family']}") }
  }

  $user = $::os['family'] ? {
    'redhat' => 'nginx',
    'debian' => 'www',
    'windows' => 'nobody',
    default => 'nginx'
  }
}
