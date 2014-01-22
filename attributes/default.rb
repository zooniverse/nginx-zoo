override['nginx']['version'] = '1.5.7'
override['nginx']['init_style'] = 'init'
override['nginx']['user'] = 'www-data'
override['nginx']['group'] = 'www-data'
override['nginx']['override_site_enabled'] = false
override['nginx']['dir'] = "/usr/local/nginx/conf"
override['nginx']['source']['prefix'] = "/usr/local/nginx"
override['nginx']['source']['version'] = node['nginx']['version']
override['nginx']['source']['url'] = "http://nginx.org/download/nginx-#{node['nginx']['source']['version']}.tar.gz"
override['nginx']['source']['conf_path'] = "#{node['nginx']['source']['prefix']}/conf/nginx.conf"
override['nginx']['source']['sbin_path'] = "#{node['nginx']['source']['prefix']}/sbin/nginx"
override['nginx']['source']['modules'] = ["nginx::http_gzip_static_module", "nginx::http_ssl_module"]
override['nginx']['source']['checksum'] = '96a5ac866323e4fef502e774d098b445dd898e44cdaea6afa68a68ab5de2e7f1'
override['nginx']['source']['default_configure_flags'] = %W[
                                                            --prefix=#{node['nginx']['source']['prefix']}
                                                            --conf-path=#{node['nginx']['source']['conf_path']}
                                                            --sbin-path=#{node['nginx']['source']['sbin_path']}
                                                           ]
