module Admin
  class ProductsController < Admin::BaseController
    before_filter :find_all_categories

    crudify :product,
            :title_attribute => 'name', :xhr_paging => true

    def index
      per_page = params[:per_page].present? ? params[:per_page].to_i : 20
      params[:page] ||= 1
      unless params[:q].blank?
        @products = Product.where('name like ?', "%#{params[:q]}%").select("name,id")
        render :json => @products.map! { |product| {"id" => product.id, "name" => product.name} }
      else
        unless params[:search].blank?
          query_products= {:name_or_description_or_product_category_name_contains => params[:search]}
          products = Product.search(query_products)
          @products = products.relation.paginate(:page => params[:page], :per_page => per_page)
        else
          @products = Product
          @products = case params[:order]
            when 'loved'
              @products.order('loves_count DESC').paginate(:page => params[:page], :per_page => per_page)
            when 'commented'
              @products.order('comments_count DESC').paginate(:page => params[:page], :per_page => per_page)
            else
              @products.paginate(:page => params[:page], :per_page => per_page)
            end
        end
        render :partial => 'products' if request.xhr?
      end
    end

    def find_all_categories
      @product_categories = ProductCategory.all
      @product_category = ProductCategory.new
    end

    def add_product_option
      @product_option = ProductOption.new(:product_id => params[:product_id])
      
      respond_to do |format|
        format.js
      end
    end
    
    def remove_product_option
      product = Product.find(params[:product_id])
      product_option = product.product_options.find(params[:product_option_id])
      @product_option_id = params[:product_option_id]
      
      if product_option
        product.product_options.delete(product_option)
        
        respond_to do |format|
          format.js
        end
      end
    end

  end
end
