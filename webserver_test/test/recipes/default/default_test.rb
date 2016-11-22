# # encoding: utf-8

# Inspec test for recipe webserver_test::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe package 'nginx' do
  it { should be_installed }
end

describe service 'nginx' do
  it { should be_enabled }
  it { should be_running }
end

describe command 'curl localhost' do
  its('stdout') { should match /Barcode/ }
end

describe port 80 do
  it { should be_listening }
end

