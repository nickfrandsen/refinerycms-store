# Store engine for Refinery CMS.

Simple engine to create a product catalog and basic shopping cart

## Install

Refinerycms-products views are in haml so add to your Gemfile

    gem 'refinerycms-store', 

And run

    bundle install
    
    rails g refinerycms_store

Now you should run new migrations

    rake db:migrate

