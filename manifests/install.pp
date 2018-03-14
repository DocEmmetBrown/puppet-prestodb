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
  $install_dir = $presto::preferences::install_dir,
  $archive_path = $presto::preferences::archive_path,
  $version = $presto::preferences::version,
  ) inherits presto::preferences {

  $dirname = $dir_name
  $filename = "${dirname}.tar.gz"
  $install_path = "${install_dir}/${dirname}"

  file {
    $install_dir:
      ensure => directory,
      ;
    "${install_dir}/presto":
      ensure  => 'link',
      target  => $install_path,
      require => File[$install_dir]

  }

  archive { $filename:
    path          => "/tmp/${filename}",
    source        => $archive_path,
    checksum_url  => "${archive_path}.sha1",
    checksum_type => 'sha1',
    extract       => true,
    extract_path  => '/opt',
    creates       => $install_path,
    cleanup       => true,
    require       => File[$install_dir],
  }

  #exec { 'tomcat permission':
  #  command   => "chown tomcat:tomcat ${install_path}",
  #  path      => $::path,
  #  subscribe => Archive[$filename],
  #}

}
