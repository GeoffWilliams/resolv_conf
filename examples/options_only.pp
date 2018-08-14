#@PDQTest
class { "resolv_conf":
  resolv_conf_path => "/etc/resolv.conf.test",
  options          => ["rotate", "timeout:2", "attempts:2"],
}