# Raises the nginx open file limit so it can handle many concurrent requests
exec { 'fix--for-nginx':
  command => 'sed -i "s/-n 15/-n 4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/',
  require => Exec['fix--for-nginx'],
}
