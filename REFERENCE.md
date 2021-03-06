# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

* [`resolv_conf`](#resolv_conf): Manage the /etc/resolv.conf file.

## Classes

### resolv_conf

Rather then using a template, the file is edited in-place. This eliminates the need
to maintain a template and means that only the items we are interested in managing
are managed. This makes it possible to use this module to say set the search domain
without necessarily setting the nameservers, which would be impossible if we insisted
on managing the whole file.

Previous versions of this module would automatically setup google DNS. This is no longer
the case.

#### Examples

##### basic usage

```puppet
include resolv_conf
```

##### Hiera data to set the nameservers

```puppet
resolve_conf::nameservers:
  - "8.8.8.8"
  - "8.8.4.4"
```

##### Hiera data to set options

```puppet
resolv_conf::options:
  - "rotate"
  - "timeout:2"
  - "attempts:2"
```

##### Hiera data to set the search domain

```puppet
resolv_conf::search: "megacorp.com"
```

#### Parameters

The following parameters are available in the `resolv_conf` class.

##### `search_keyword`

Data type: `Optional[String]`

Keyword prefix for search domains

##### `search`

Data type: `Optional[String]`

Search domain

Default value: `undef`

##### `options`

Data type: `Optional[Array[String]]`

Array of options

Default value: []

##### `nameservers`

Data type: `Optional[Array[String]]`

Array of nameservers

Default value: []

##### `resolv_conf_path`

Data type: `String`

Path to /etc/resolve.conf

Default value: "/etc/resolv.conf"

##### `resolv_conf_owner`

Data type: `String`

Owner for /etc/resolv.conf

Default value: "root"

##### `resolv_conf_group`

Data type: `Integer`

Group for /etc/resolv.conf

Default value: 0

##### `resolv_conf_mode`

Data type: `String`

Mode for /etc/resolv.conf

Default value: "0644"

##### `header`

Data type: `String`

Header to insert into /etc/resolv.conf

Default value: "# managed by puppet"

