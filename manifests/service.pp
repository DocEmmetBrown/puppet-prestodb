# presto::service
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include presto::service
class presto::service (

  ){
  systemd::service { 'presto':
    description => 'presto',
    after       => 'network.target',
    user        => 'presto',
    execstart   => '/opt/presto/bin/launcher start',
  }
}
