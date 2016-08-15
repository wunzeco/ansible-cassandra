require 'spec_helper'

cassandra_log_dir = '/var/log/cassandra'
cassandra_conf_dir = '/etc/cassandra'
cassandra_home_dir = '/var/lib/cassandra'

describe group('cassandra') do
  it { should exist }
end

describe user('cassandra') do
  it { should exist }
  it { should belong_to_group 'cassandra' }
end

describe package('datastax-ddc') do
  it { should be_installed }
end

%W(
  #{cassandra_log_dir}
  #{cassandra_home_dir}
).each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'cassandra' }
  end
end

describe file(cassandra_conf_dir) do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
end

%w(
  /etc/init.d/cassandra
  /etc/default/cassandra
).each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end

%W(
  #{cassandra_conf_dir}/cassandra.yaml
  #{cassandra_conf_dir}/cassandra-env.sh
  #{cassandra_conf_dir}/cassandra-rackdc.properties
  #{cassandra_conf_dir}/cassandra-topology.properties
  #{cassandra_conf_dir}/cassandra-topology.yaml
  #{cassandra_conf_dir}/commitlog_archiving.properties
  #{cassandra_conf_dir}/logback-tools.xml
  #{cassandra_conf_dir}/logback.xml
).each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
  end
end

describe service('cassandra') do
  it { should be_running }
end
