@test "header set" {
    grep "managed by puppet" /etc/resolv.conf.test
}

@test "search was set" {
    grep "search megalan megacorp.com" /etc/resolv.conf.test
}

@test "ns1 set ok" {
    grep "nameserver 10.10.10.10" /etc/resolv.conf.test
}

@test "ns2 set ok" {
    grep "nameserver 11.11.11.11" /etc/resolv.conf.test
}

@test "option1 set ok" {
    grep "option rotate" /etc/resolv.conf.test
}

@test "option2 set ok" {
    grep "option timeout:2" /etc/resolv.conf.test
}

@test "option3 set ok" {
    grep "option attempts:2" /etc/resolv.conf.test
}

@test "old ns1 removed" {
    ! grep "40.0.0.1" /etc/resolv.conf.test
}

@test "old ns2 removed" {
    ! grep "40.0.0.2" /etc/resolv.conf.test
}

@test "old search removed" {
    ! grep "search old broken" /etc/resolv.conf.test
}
