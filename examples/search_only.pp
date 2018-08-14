#@PDQTest
class { "resolv_conf":
  resolv_conf_path => "/etc/resolv.conf.test",
  search           => "megalan megacorp.com",
 }