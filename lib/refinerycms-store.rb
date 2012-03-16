module Refinerycms
  module Store
    module ShoppingCart
      module Controllers
        autoload :Helpers, 'controllers/helpers'
      end
    end
    
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "products"
          plugin.activity = {
            :class => Product,
            :title => 'name'
          }
          plugin.menu_match = /^(admin|refinery)\/(product_categor(y|ie)|product)s?/
        end
      end
    end
  end
end
