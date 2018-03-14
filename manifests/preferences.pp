# presto::preferences
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include presto::preferences
class presto::preferences {
  #install
  $version = '0.196'
  $archive_basename = "presto-server-${version}"
  $archive_path = "https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${version}/${archive_basename}.tar.gz"
  #TODO find a way to get the latest

  #Global vars
  $config_dir = '/etc/presto'
  $install_dir = '/opt'
  $dir_name = $archive_basename


  #etc/node.properties
  $node_environment = 'production'
  $node_id = fqdn_rand_uuid('presto')
  $node_data_dir = '/var/presto/data'

  #etc/jvm.config
  $jvm_max_memory_m = round($::memorysize_mb * 0.8)

  #etc/config.properties
  $coordinator = true
  $node_scheduler_include_coordinator = true
  $http_server_http_port = '8080'
  $query_max_memory = '50GB'
  $query_max_memory_per_node = '1GB'
  $discovery_server_enabled = true
  $discovery_uri = 'http://XX.XX.XX.XX:8080'

  #etc/log.properties
  $log_level = 'INFO'




}
