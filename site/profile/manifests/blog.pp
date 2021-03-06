class profile::blog {
  class { 'apache':
    docroot => '/var/www',
  }
  class { 'apache::mod::php': }

  class { 'mysql::server':
    root_password => 'supersecret',
  }

  class { 'mysql::bindings::php': }

  class { 'wordpress':
    install_dir => '/var/www/wp',
  }
}
