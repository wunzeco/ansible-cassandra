Cassandra
========

Ansible role to install and configure Cassandra (DataStax Community Edition).

*Note:* Recommended Java version is 8

## Examples

```
- hosts: dbhost

  vars:
    cassandra_version: 2.2.5
    cassandra_dsc_version: 2.2.5-1

  roles:
    - wunzeco.cassandra
```

## Dependencies:

None
