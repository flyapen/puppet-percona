# Class: percona
#
# This class installs percona
#
# Parameters:
#
# Actions:
#   - Install PerconaDB
#   - Install PerconaXtraDB
#
# Requires:
#   - camp2camp puppet-apt module:
#     source: https://github.com/camptocamp/puppet-apt
#
# Sample Usage:
#
#  node server {
#    class { 'percona':
#      server          => 'true',
#      percona_version => '5.5';
#    }
#
#  node client {
#    include percona': }
#  }
#
# Valid options:
#
# Known issues:
#
class percona (
  $client          = true,
  $server          = undef,
  $percona_version = '5.5' # Options: 5.1, 5.5
) {

  include percona::params
  include percona::preinstall
  include percona::install
  include percona::config
  include percona::service

  Class['percona::params'] ->
  Class['percona::preinstall'] ->
  Class['percona::install'] ->
  Class['percona::config'] ->
  Class['percona::service']
}
