# presto::catalog
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include presto::catalog
define presto::catalog (
  $properties,
  $dir_name = $presto::preferences::dir_name,
  $install_dir = $presto::preferences::install_dir,
  ){
    $install_path = "${install_dir}/${dir_name}"
    $config_dir = "${install_path}/etc"

    file { "${config_dir}/catalog/${title}.properties" :
      ensure  => present,
      content => template('presto/etc/catalog.erb'),
    }


}
