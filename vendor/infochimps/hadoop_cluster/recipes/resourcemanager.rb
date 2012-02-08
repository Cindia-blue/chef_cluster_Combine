# To change this template, choose Tools | Templates
# and open the template in the editor.

include_recipe "hadoop_cluster"
include_recipe "runit"

include_recipe "hadoop_cluster::cluster_conf"

#hadoop_service(:resourcemanager)

script "start_resourcemanager" do
  interpreter "bash"
  cwd "#{node[:hadoop][:common_home_dir]}"
  code <<-EOH
   ./bin/yarn-daemon.sh start resourcemanager
  EOH
end
