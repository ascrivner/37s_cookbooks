template "/etc/apt/preferences" do
  source 'preferences.erb'
end

%w{/var/cache/local /var/cache/local/preseeding}.each do |dirname|
  directory dirname do
    owner "root"
    group "root"
    mode  0644
    action :create
  end
end

execute "apt-get-update" do
  command "apt-get update"
end
