require 'spec_helper'

describe "nginx-zoo::default" do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it "should install nginx from source" do
    expect(chef_run).to include_recipe('nginx::source')
  end

  it "should create a configuration file for nginx" do
    expect(chef_run).to render_file('/usr/local/nginx/conf/nginx.conf')
  end

  it "should create an upstart config for nginx" do
    expect(chef_run).to render_file('/etc/init/nginx.conf')
      .with_content("/usr/local/nginx/conf/nginx.conf")
  end

  it "should tell nginx to restart" do
    expect(chef_run).to notify('service[nginx]').to(:restart)
  end

end
