# webserver_test

Objective: Install Nginx application using Chef Supermarket and Host supermarket web-application

Prerequisites:

1. Chefdk - Includes Kitchen-vagrant, Foodcritic, Rubocop, Chefspec and Berkshelf
2. Vagrant
3. Ruby

Procedure:

1. Installation of Chefdk. USe Chef 12.0 or above versions

Download the Chef Developement Kit from URL: https://downloads.chef.io/chef-dk/

2. Vagrant can be downloaded and installed from URL:https://www.vagrantup.com/downloads.html [In Ubuntu platforms "sudo apt-get install vagrant should do the trick]

3. Ruby 2.1 or above is recommended to be installed in the working environment

***Steps to Create the Cookbook***

* Intially create a cookbook using the following command:

-- chef generate cookbook [name of cookbook]

* This will create the basic Chef cookbook directory structure required for our purpose.

Steps to use Chef-supermarket to install Nginx:

***Using the Chef-supermarket Nginx cookbook***

Declare the include_recipe of the chef-supermarket cookbook being used in the  file webserver-test/receipes/default.rb 

Declare the depends 'nginx', '~> 2.7.6 in the metadata.rb file 

Declare the dependency cookbook in  i.e., Berksfile cookbook 'nginx', '~> 2.7.6' 

Next edit the serverspec code in the test direcotry to validate the installation of the Nginx package. 

Edit the provisioner in the  file from  to .kitchen.yml chef_zero chef_solo and also include.

Include the additional platforms such as centos-6.7 and ubunutu-14.04 along with existing platforms.

***Steps to run the test***

---Preconvergence tests:

1.Foodcritic is a helpful lint tool you can use to check your Chef cookbooks for common problems. [URL: http://www.foodcritic.io/]

Command: foodcritic [cookbook name]

2.RuboCop is a style and linting tool that analyzes all of the Ruby code that is authored in a cookbook against a number of rules.

Command: rubocop [cookbook name]

---Unit Testing:

ChefSpec is a unit testing framework for testing Chef cookbooks. ChefSpec makes it easy to write examples and get fast feedback on cookbook changes without the need for virtual machines or cloud servers.

ChefSpec runs your cookbook(s) locally with Chef Solo without actually converging a node. This has two primary benefits:

It's really fast!
Your tests can vary node attributes, operating systems, and search results to assert behavior under varying conditions.

Command: rspec spec/unit/recipes/default_spec.rb --color

---Integration Testing:

With Serverspec, you can write RSpec tests for checking your servers are configured correctly. The true aim of Serverspec is to help refactoring infrastructure code.
