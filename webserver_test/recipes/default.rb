#
# Cookbook Name:: webserver_test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'apt-get update' do
  command 'apt-get update -y'
end

include_recipe 'nginx::default'

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

