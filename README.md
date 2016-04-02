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
    cassandra_cluster_name: myAwesomeCluster
    cassandra_seeds: [ "seedIp1", "seedIp2" ]  			# List of IP Addresses ONLY
    cassandra_listen_address: "{{ ansible_eth0.ipv4.address }}"
    cassandra_rpc_address: "{{ ansible_eth0.ipv4.address }}"

  roles:
    - wunzeco.cassandra
```

## Dependencies:

None
