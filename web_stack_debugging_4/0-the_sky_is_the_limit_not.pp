# this increases the amount of traffic an Nginx server can handle.
# it does this by increasing the ULIMIT in the default file

exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
} ->

# Restart Nginx
exec { 'nginx-restart':
  command => 'nginx restart',
    path  => '/etc/init.d/'
}