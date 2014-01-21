include_recipe 'nginx::source'

if node.chef_environment == "production"
  include_recipe 'monit'
  monitrc 'nginx', category: 'servers'
end

cookbook_file '/usr/local/nginx/conf/nginx.conf' do
  source 'nginx.conf'
  owner 'root'
  group 'root'
  mode '755'

  notifies :restart, 'service[nginx]'
end