## site.pp ##
File { backup => false }

ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

node 'josephoaks.puppetlabs.vm' {
  # Homework 1
  #include nginx
  include wrappers::epel
  include users::admins
  include profile::blog
  
  # Exercise 11.1
  include memcached
  
  # Exercise 12.2
  if $::virtual == 'docker' {
    notify { "This is a ${::virtual} system.": }
  }
}

node default {
  include role::classroom
  include examples::fundamentals
}
