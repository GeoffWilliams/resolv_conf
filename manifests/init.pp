# Resolve_conf
#
# Manage the /etc/resolv.conf file.
#
# Rather then using a template, the file is edited in-place. This eliminates the need
# to maintain a template and means that only the items we are interested in managing
# are managed. This makes it possible to use this module to say set the search domain
# without necessarily setting the nameservers, which would be impossible if we insisted
# on managing the whole file.
#
# Previous versions of this module would automatically setup google DNS. This is no longer
# the case.
#
# @example basic usage
#   include resolv_conf
#
# @example Hiera data to set the nameservers
#   resolve_conf::nameservers:
#     - "8.8.8.8"
#     - "8.8.4.4"
#
# @example Hiera data to set options
#   resolv_conf::options:
#     - "rotate"
#     - "timeout:2"
#     - "attempts:2"
#
# @example Hiera data to set the search domain
#   resolv_conf::search: "megacorp.com"
#
# @param search_keyword Keyword prefix for search domains
# @param search Search domain
# @param options Array of options
# @param nameservers Array of nameservers
# @param resolv_conf_path Path to /etc/resolve.conf
# @param resolv_conf_owner Owner for /etc/resolv.conf
# @param resolv_conf_group Group for /etc/resolv.conf
# @param resolv_conf_mode Mode for /etc/resolv.conf
# @param header Header to insert into /etc/resolv.conf
class resolv_conf(
    Optional[String]        $search_keyword,
    Optional[String]        $search             = undef,
    Optional[Array[String]] $options            = [],
    Optional[Array[String]] $nameservers        = [],
    String                  $resolv_conf_path   = "/etc/resolv.conf",
    String                  $resolv_conf_owner  = "root",
    Integer                 $resolv_conf_group  = 0,
    String                  $resolv_conf_mode   = "0644",
    String                  $header             = "# managed by puppet",
) {

  # work out what lines should be in the file
  $search_line = "${search_keyword} ${search}"
  $nameservers_lines = $nameservers.map |$l| {
    "nameserver ${l}"
  }.join("\n")
  $options_lines = $options.map |$l| {
    "option ${l}"
  }.join("\n")

  file { $resolv_conf_path:
    ensure => file,
    owner  => $resolv_conf_owner,
    group  => $resolv_conf_group,
    mode   => $resolv_conf_mode,
  }

  fm_prepend { $resolv_conf_path:
    ensure => present,
    data   => $header,
  }

  if $search {
    fm_replace { "${resolv_conf_path} search line":
      ensure            => present,
      path              => $resolv_conf_path,
      data              => $search_line,
      match             => "^${search_keyword}",
      insert_if_missing => true,
      insert_at         => "top",
    }
  }

  if ! $nameservers.empty {
    fm_replace { "${resolv_conf_path} nameservers lines":
      ensure            => present,
      path              => $resolv_conf_path,
      data              => $nameservers_lines,
      match             => "^nameserver ",
      insert_if_missing => true,
      insert_at         => "bottom",
    }
  }

  if ! $options.empty {
    fm_replace { "${resolv_conf_path} options lines":
      ensure            => present,
      path              => $resolv_conf_path,
      data              => $options_lines,
      match             => "^option ",
      insert_if_missing => true,
      insert_at         => "bottom",
    }
  }

  # On Solaris must also bounce the dns client service
  if $facts['os']['family'] == "Solaris" {
    Service { "dns/client":
      ensure    => running,
      enable    => true,
      subscribe => File[$resolv_conf_path],
    }
  }
}
