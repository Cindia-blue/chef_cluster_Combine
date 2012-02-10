# To change this template, choose Tools | Templates
# and open the template in the editor.

include_recipe "hadoop_cluster"
include_recipe "runit"
include_recipe "hadoop_cluster::cluster_conf"

script "chown_nodemanager" do
  interpreter "bash"
  cwd "#{node[:hadoop][:common_home_dir]}"
  code <<-EOH
     chown -R mapred:hadoop /home/ubuntu/hadoop/hadoop-0.23.0/logs
     chown -R mapred:hadoop /tmp/nm/local
  EOH
end

script "start_nodemanager" do
  interpreter "bash"
  cwd "#{node[:hadoop][:common_home_dir]}"
  user 'mapred'
  code <<-EOH
   ./bin/yarn-daemon.sh start nodemanager
  EOH
end
