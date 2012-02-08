# To change this template, choose Tools | Templates
# and open the template in the editor.

include_recipe "hadoop_cluster"
include_recipe "runit"
include_recipe "hadoop_cluster::cluster_conf"

script "start_nodemanager" do
  interpreter "bash"
  cwd "#{node[:hadoop][:common_home_dir]}"
  code <<-EOH
   ./bin/yarn-daemon.sh start nodemanager
  EOH
end
