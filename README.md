[![Build Status](https://travis-ci.org/GeoffWilliams/resolv_conf.svg?branch=master)](https://travis-ci.org/GeoffWilliams/resolv_conf)
# resolve_conf

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manage `/etc/resolv.conf` with Puppet on:
  * AIX,
  * RHEL/CentOS
  * FreeBSD
  * Solaris
  * Suse

## Setup

### What resolve_conf affects
* Manages the `/etc/resolv.conf` file
* Restarts the `dns/client` on Solaris if the file is changed

## Usage

### Basic

```puppet
include resolv_conf
```

Use Google DNS

### Customised

```puppet
class { "resolv_conf":
  search      => "megacorp.com",
  nameservers => ["10.0.0.1", "10.0.4.4"],
}
```

Set a search domain and use specific nameservers.

## Reference
[generated documentation](https://rawgit.com/GeoffWilliams/resolve_conf/master/doc/index.html).

Reference documentation is generated directly from source code using [puppet-strings](https://github.com/puppetlabs/puppet-strings).  You may regenerate the documentation by running:

```shell
bundle exec puppet strings
```


The documentation is no substitute for reading and understanding the module source code, and all users should ensure they are familiar and comfortable with the operations this module performs before using it.


## Limitations

* Assumes that cron itself is already installed
* Does not attempt to manage the cron services
* Not supported by Puppet, Inc.

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example
