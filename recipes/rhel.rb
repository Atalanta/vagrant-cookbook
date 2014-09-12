package_name = "vagrant_#{node['vagrant']['version']}_#{node['kernel']['machine']}.rpm"
package_source = File.join(node['vagrant']['base_url'], package_name)
remote_file "#{Chef::Config[:file_cache_path]}/vagrant.rpm" do
  source package_source
  notifies :install, "rpm_package[vagrant]", :immediately
end

rpm_package "vagrant" do
  source "#{Chef::Config[:file_cache_path]}/vagrant.rpm"
end
