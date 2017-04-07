# Resolve_conf::Param
#
# Params pattern
class resolv_conf::params {
  $resolv_conf_path   = "/etc/resolv.conf"
  $nameservers        = ["8.8.8.8"]
  $resolv_conf_owner  = "root"
  $resolv_conf_mode   = "0644"
  $search             = ""
  $resolv_conf_group  = "0"

  case $facts['os']['family'] {
    "AIX": {
      $search_keyword     = "domain"
      $options            = ["rotate", "timeout:2", "attempts:2"]
    }
    "Solaris": {
      $search_keyword     = "search"
      $options            = []
    }
    "RedHat": {
      $search_keyword     = "search"
      $options            = []
    }
    "FreeBSD": {
      $search_keyword     = "search"
      $options            = []
    }
    "Suse": {
      $search_keyword     = "search"
      $options            = []
    }
    default: {
      fail("class ${name} does not support ${facts['os']['family']}")
    }
  }
}
