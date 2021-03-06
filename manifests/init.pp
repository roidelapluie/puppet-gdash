# Class: gdash
#
# This module manages gdash
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class gdash (
  $graphitehost='127.0.0.1'
)
{
  $gdashroot = '/usr/local/gdash/'
  package {
    'rubygem-sinatra':
      ensure => '1.3.2-1'
  }
  package {
    'rubygem-bundler':
      ensure => present
  }
  package {
    'rubygem-tilt':
      ensure => present
  }
  package {
    'rubygem-rack':
      ensure => present
  }
  package {
    'rubygem-rack-protection':
      ensure => present
  }




  package {"gdash": ensure => present }

  file {
    "${gdashroot}/config/gdash.yaml":
      content => template('gdash/gdash.yaml.erb'),
      group   => '0',
      owner   => '0',
      require => Package['gdash'],
  }


}

