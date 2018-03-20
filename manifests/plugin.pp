# presto::plugin
#
# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   presto::plugin { 'namevar': }

define presto::plugin(
  $directory,
  $url,
  $checksum = undef,
  $checksum_type = undef,

) {

  archive { $title :
    ensure        => present,
    path          => "/opt/presto/plugin/${directory}/${title}",
    #extract       => true,
    #extract_path  => "/opt/presto/plugin/${directory}",
    source        => $url,
    checksum      => $checksum,
    checksum_type => $checksum_type,
    #creates       => "/opt/presto/plugin/${title}",
    cleanup       => false,
  }

}
