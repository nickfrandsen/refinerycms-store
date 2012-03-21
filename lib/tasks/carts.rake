namespace :refinery do
  
  namespace :carts do
    
    # call this task my running: rake refinery:carts:my_task
    desc "Clean out carts older than 7 days"
    task :cleanup => :environment do
      Cart.where("updated_at <= ?", 7.days.ago).delete_all
    end
  
  end
  
end