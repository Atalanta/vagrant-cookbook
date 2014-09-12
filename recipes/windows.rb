
package_name = "vagrant_#{node['vagrant']['version']}.msi"
package_source = File.join(node['vagrant']['base_url'], package_name)

windows_package "Vagrant #{node['vagrant']['msi_version']}" do
  source package_source
  checksum node['vagrant']['checksum']
  action :install
end
