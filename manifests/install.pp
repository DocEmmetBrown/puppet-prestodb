# presto::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include presto::install
class presto::install (
  $dir_name = $presto::preferences::dir_name,
  $archive_path = $presto::preferences::archive_path,
  $install_dir = $presto::preferences::install_dir,
  ) inherits presto::preferences {

  $dirname = $dir_name
  $filename = "${dirname}.tar.gz"
  $install_path = "${install_dir}/${dirname}"

  #file { '/opt/presto':
  #  ensure => 'link',
  #  target => $install_path
  #}

  archive { $filename:
    path          => "/tmp/${filename}",
    source        => $archive_path,
    checksum_url  => "${archive_path}.sha1",
    checksum_type => 'sha1',
    extract       => true,
    extract_path  => '/opt',
    creates       => $install_path,
    cleanup       => true,
    require       => File[$install_path],
  }

  #exec { 'tomcat permission':
  #  command   => "chown tomcat:tomcat ${install_path}",
  #  path      => $::path,
  #  subscribe => Archive[$filename],
  #}

}
