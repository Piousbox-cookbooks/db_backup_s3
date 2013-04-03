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


# curl https://raw.github.com/timkay/aws/master/aws -o aws

user = 'ubuntu'
group = 'ubuntu'
aws_key = data_bag_item('utils', 's3')['key']
aws_secret = data_bag_item('utils', 's3')['secret']

template "~/.awssecret" do
  source "awssecret.erb"
  owner user
  group group
  mode '0600'

  variables(
    :key => aws_key,
    :secret => aws_secret
  )
end

