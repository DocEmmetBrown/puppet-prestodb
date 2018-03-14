# presto::config
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include presto::config
class presto::config (
  $dir_name = $presto::preferences::dir_name,
  $install_dir = $presto::preferences::install_dir,
  $node_environment = $presto::preferences::node_environment,
  $node_id = $presto::preferences::node_id,
  $node_data_dir = $presto::preferences::node_data_dir,
  $jvm_max_memory_m = $presto::preferences::jvm_max_memory_m,
  $coordinator = $presto::preferences::coordinator,
  $node_scheduler_include_coordinator =   $presto::preferences::node_scheduler_include_coordinator,
  $http_server_http_port = $presto::preferences::http_server_http_port,
  $query_max_memory = $presto::preferences::query_max_memory,
  $query_max_memory_per_node = $presto::preferences::query_max_memory_per_node,
  $discovery_server_enabled = $presto::preferences::discovery_server_enabled,
  $discovery_uri = $presto::preferences::discovery_uri,
  $log_properties = $presto::preferences::log_properties,
  ) inherits presto::preferences {
  $install_path = "${install_dir}/${dir_name}"
  $config_dir = "${install_path}/etc"

  file {
    $config_dir:
      ensure => directory,
  }

  file {
    "${config_dir}/node.properties":
      ensure  => present,
      content => template('presto/etc/node.properties.erb'),
      require => File[$config_dir]
      ;
    "${config_dir}/config.properties":
      ensure  => present,
      content => template('presto/etc/config.properties.erb'),
      require => File[$config_dir]
      ;
    "${config_dir}/jvm.config":
      ensure  => present,
      content => template('presto/etc/jvm.config.erb'),
      require => File[$config_dir]
      ;
    "${config_dir}/log.properties":
      ensure  => present,
      content => template('presto/etc/log.properties.erb'),
      require => File[$config_dir]
  }

}
