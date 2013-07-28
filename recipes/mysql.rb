#
# Cookbook Name:: db_backup_s3
# Recipe:: default
#
# Copyright 2013, Piousbox
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

packages = %w{
  zip
}

packages.each do |pkg|
  package pkg do
    action :install
  end
end

aws_key = data_bag_item('utils', 's3')['key']
aws_secret = data_bag_item('utils', 's3')['secret']
db_names = data_bag_item('utils', 'db_config')['mysql_databases']
db_host = data_bag_item('utils', 'db_config')['mysql_ip']
db_passwd = data_bag_item('utils', 'db_config')['mysql_password']
bucket_name = data_bag_item('utils', 'db_config')['backup_bucket_name']
workdir = "/home/ubuntu/mysql"

template "/usr/local/bin/aws" do
  source "aws"
  mode "0700"
  user 'root'
end

execute "mkdir -p #{workdir}"

db_names.each do |db_name|
  execute "cd #{workdir} && mysqldump -h #{db_host} -u root -p#{db_passwd} -d #{db_name} > #{db_name}.sql && " + 
          "zip -r `date +%Y%m%d`.#{db_name}.sql.zip #{db_name}.sql"

  execute "cd #{workdir} && EC2_ACCESS_KEY=#{aws_key} EC2_SECRET_KEY=#{aws_secret} " + 
          "/usr/local/bin/aws put #{bucket_name}/sql_backup/`date +%Y%m%d`.#{db_name}.sql.zip `date +%Y%m%d`.#{db_name}.sql.zip"

end

# execute "cd && rm -rf #{workdir}/*"
