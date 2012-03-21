::Refinery::Application.routes.draw do

  resources :products, :only => [:index, :show]

  match "/paypal/ipn", :to => "payments#paypal_ipn", :as => 'paypal_ipn'
  
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do

    match '/event/add_product_option(/:product_id)' => 'products#add_product_option', :as => 'add_product_option'
    match '/event/remove_product_option(/:product_id)(/:product_option_id)' => 'products#remove_product_option', :as => 'remove_product_option'

    resources :products, :except => :show do
      collection do
        post :update_positions
      end
    end

    resources :product_categories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  
  resources :cart,
            :only => [:index, :create, :update],
            :as => :carts,
            :controller => 'carts'
  resources :cart_items, :only => [:destroy]
end
