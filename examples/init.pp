#@PDQTest
#
# We have to write to a "test" resolv.conf as docker controls the real one
class { "resolv_conf":
  resolv_conf_path => "/etc/resolv.conf.test",
  search           => "megalan megacorp.com",
  nameservers      => ["10.10.10.10", "11.11.11.11"]
}