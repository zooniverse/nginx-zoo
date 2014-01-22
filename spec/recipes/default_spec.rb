require 'spec_helper'

describe "nginx-zoo::default" do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it "should install nginx from source" do
    expect(chef_run).to include_recipe('nginx::source')
  end

  it "should create a configuration file for nginx" do
    expect(chef_run).to render_file('/usr/local/nginx/conf/nginx.conf')
  end

  it "should create a sysV init config for nginx" do
    expect(chef_run).to render_file('/etc/init.d/nginx.conf')
  end

  it "should tell nginx to restart" do
    r = chef_run.cookbook_file("/usr/local/nginx/conf/nginx.conf")
    expect(r).to notify('service[nginx]').to(:restart)
  end

end
