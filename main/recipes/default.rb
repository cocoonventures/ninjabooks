package 'git-core'

include_recipe "ruby-shadow"

user node[:deploy_user][:name] do
  supports manage_home: true
  comment "Deployius deVander-Shank"
  gid "sudo"
  home "/home/#{node[:deploy_user][:name]}"
  shell "/bin/bash"
  password node[:deploy_user][:password]
end

template "/home/#{node[:deploy_user][:name]}/.bashrc" do
	source "bashrc.erb"
	owner node[:deploy_user][:name]
	mode 00644
end

template "/home/#{node[:deploy_user][:name]}/.bash_profile" do
	source "bash_profile.erb"
	owner node[:deploy_user][:name]
	mode 00644
end
