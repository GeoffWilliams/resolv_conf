#@PDQTest
class { "resolv_conf":
  resolv_conf_path => "/etc/resolv.conf.test",
  nameservers      => ["10.10.10.10", "11.11.11.11"],
}