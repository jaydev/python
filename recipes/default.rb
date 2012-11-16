#
# Author:: Seth Chisamore <schisamo@opscode.com>
# Cookbook Name:: python
# Recipe:: default
#
# Copyright 2011, Opscode, Inc.
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

include_recipe "python::#{node['python']['install_method']}"
include_recipe "python::pip"
include_recipe "python::virtualenv"

venv_path = "/home/vagrant/.virtualenvs/orzata"

python_pip "virtualenvwrapper" do
  action :install
end

python_virtualenv venv_path do
  owner "vagrant"
  group "vagrant"
  action :create
end

python_pip "django" do
  virtualenv venv_path
  version "1.4.2"
  action :install
end

python_pip "ipdb" do
  virtualenv venv_path
  version "0.6.1"
  action :install
end

python_pip "ipython" do
  virtualenv venv_path
  version "0.10.2"
  action :install
end

python_pip "psycopg2" do
  virtualenv venv_path
  action :install
end

python_pip "numpy" do
  virtualenv venv_path
  action :install
end
