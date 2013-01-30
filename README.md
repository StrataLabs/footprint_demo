footprint_demo
==============

dummy project for footprint testing

This refers to the use of the gem footprint. Points to remember:

1) Footprint works with Rails 3.2.x

2) Footprint works with rvm 1.9.3

3) Check the gemfile in demo project for known working gems with footprint


STEPS TO USE FOOTPRINT :-

1. Install rails 3.2 (gemfile rails 3.2 as mentioned in the gemfile)

2. rvm install 1.9.3

3. install footprint by gem "footprint", "1.0.0.rc2"

4. install mongodb (follow steps on http://docs.mongodb.org/manual/installation/) which are as below

	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

	Create a /etc/apt/sources.list.d/10gen.list file and include the following line for the 10gen repository.

	deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen

	Now issue the following command to reload your repository:

	sudo apt-get update

	Install Packages

	Issue the following command to install the latest stable version of MongoDB:

	sudo apt-get install mongodb-10gen

5. Generate mongoid.yml if you don't have one in your project already

	$ rails g mongoid:config

6. Modify your config/application.rb to still use ActiveRecord generators by default and to enforce

	config.generators do |g| 
	  g.orm :active_record 
	end

7. Add a special lookup for Mongoid gem: (will be removed when Mongoid 3.1.0 is released)

	gem "mongoid", :git => 'git@github.com:mongoid/mongoid.git'

8. Setting Up Documents for your ActiveRecord models

	Generate a document from an existing ActiveRecord Model

	$ rails g footprint:document User

	Add leave_a_track to your Model class

	class User < ActiveRecord::Base
	  leave_a_track
	  attr_accessible :name, :dob
	end

	In case rails g footprint fails for some reason, then:

	1. create a model myproject_footprint.rb (similar to book_footprint.rb as in this project)
		class BookFootprint < Footprint::Impression
  		store_in collection: "books"
		end
	

	Note: BigDecimal is not working with footprint. Explicitly declare the type to integer/string(whichever suits) in the 			project_footprint.rb

9. Using impressions
	1. Find the record , for ex, a= Book.find(1)
		a.impressions
	will give all the records whenever there was a change
	2. You can use order by and pagination as well.
		b = a.impressions.desc(:updated_at).to_a.paginate(:page => params[:page], :per_page => 5)

10. References : https://github.com/subhashb/footprint
		 http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/


Email: jibranrules@gmail.com





