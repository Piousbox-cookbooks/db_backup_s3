#
# Cookbook Name:: mongodb_backup_s3
# Recipe:: default
#
# Copyright 2013, CAC
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

aws_key = data_bag_item('utils', 's3')['key']
aws_secret = data_bag_item('utils', 's3')['secret']
db_name = data_bag_item('utils', 'db_config')['mongodb_database']
db_host = data_bag_item('utils', 'db_config')['mongodb_ip']
bucket_name = data_bag_item('utils', 'db_config')['backup_bucket_name']

template "~/aws" do
  source "aws"
  mode "0700"
end

template "~/.awssecret" do
  source "awssecret.erb"
  mode '0600'

  variables(
    :key => aws_key,
    :secret => aws_secret
  )
end

script 'create the dump file' do
  %{ mkdir -p /tmp/mongodb && 
     cd /tmp/mongodb && 
     mongodump -h #{db_host} -d #{db_name} && 
     cd dump && 
     zip -r `date +%Y%m%d`.#{db_name}.zip #{db_name}
   }
end

script 'upload the dump file to s3' do
  %{ cd /tmp/mongodb && 
     ~/aws put #{bucket_name}/mongodb/`date +%Y%m%d`.#{db_name}.zip `date +%Y%m%d`.#{db_name}.zip
   }
end

script 'cleanup' do
  %{ cd /tmp/mongodb &&
     rm -rf dump
   }
end

