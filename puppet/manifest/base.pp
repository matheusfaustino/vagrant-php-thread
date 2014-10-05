class apache {
  # Ensures Apache2 is installed
  package { 'apache2':
    name => 'apache2-mpm-prefork', # httpd if CentOS
    ensure => installed,
  }
 
  # Ensures the Apache service is running
  service { 'apache2':
    ensure  => 'apache2', # httpd if CentOS
    ensure  => running,
    require => Package['apache2'],
  }
}
