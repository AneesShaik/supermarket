#
# Cookbook Name:: webserver_test
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'webserver_test::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'installs nginx' do
    expect(chef_run).to install_package 'nginx'
  end

  it 'enables the nginx service' do
    expect(chef_run).to enable_service 'nginx'
  end

  it 'starts the nginx service' do
    expect(chef_run).to start_service 'nginx'
  end
end
