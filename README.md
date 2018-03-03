Cassandra
========

Ansible role to install and configure Apache Cassandra.

> *Note:*
>     - Recommended Java version is 8
>     - Support for datastax community edition dropped
>     - Recommended `cassandra_distro` is `apache`
>     - Support for ddc `cassandra_distro` to be deprecated soon


## Examples

```
- hosts: dbhost

  vars:
    cassandra_distro: apache
    cassandra_version: 3.11.2
    cassandra_cluster_name: myAwesomeCluster
    cassandra_seeds: [ "seedIp1", "seedIp2" ]  			# List of IP Addresses ONLY
    cassandra_listen_address: "{{ ansible_eth0.ipv4.address }}"
    cassandra_rpc_address: "{{ ansible_eth0.ipv4.address }}"

  roles:
    - wunzeco.cassandra
```
> **INFO:**
>
> 		If your seed nodes have DNS resolveable FQDNs, you may use
>		**cassandra_seeds_fqdn** (instead of cassandra_seeds).


## Testing

To run integration tests of this role

```
PLATFORM=ubuntu-1404            # other options - ubuntu-1604 or centos
kitchen verify $PLATFORM && kitchen destroy $PLATFORM
```

> **Note:**
>   `kitchen test` command is not appropriate for this role because both kitchen
>    suites (instances) need to be up and running for all tests to pass.


## Dependencies:

None
