
package_name = "vagrant_#{node['vagrant']['version']}_#{node['kernel']['machine']}.deb"
package_source = File.join(node['vagrant']['base_url'], package_name)

remote_file "#{Chef::Config[:file_cache_path]}/vagrant.deb" do
  source package_source
  notifies :install, "dpkg_package[vagrant]", :immediately
end

dpkg_package "vagrant" do
  source "#{Chef::Config[:file_cache_path]}/vagrant.deb"
end
