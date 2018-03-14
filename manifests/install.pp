# presto::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include presto::install
class presto::install (
  $user_name = $presto::preferences::user_name,
  $group_name = $presto::preferences::group_name,
  $dir_name = $presto::preferences::dir_name,
  $install_dir = $presto::preferences::install_dir,
  $archive_path = $presto::preferences::archive_path,
  $version = $presto::preferences::version,
  ) inherits presto::preferences {

  $dirname = $dir_name
  $filename = "${dirname}.tar.gz"
  $install_path = "${install_dir}/${dirname}"

  group { $group_name:
    ensure => present,
  }

  user { $user_name:
    ensure => present,
    groups => [ $group_name ],
  }

  file {
    $install_dir:
      ensure => directory,
      user   => $user_name,
      group  => $group_name,
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
    extract_path  => $install_dir,
    creates       => $install_path,
    user          => $user_name,
    group         => $group_name,
    cleanup       => true,
    require       => File[$install_dir],
  }

}
