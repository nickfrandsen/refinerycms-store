class ProductsController < ApplicationController
  helper :love
  helper :rank
  helper :worn
  include ProductsFilter

  before_filter :find_page

  def index
    sort_products!

    apply_manual_filters!

    filter_by_brand!
    filter_by_category_name!

    @products = @products.paginate(:page => params[:page])
 
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end

  def show
    @product = Product.find(params[:id])
    @related_videos = Video.by_product @product
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end
  
protected

  def find_page
    @page = Page.where(:link_url => "/products").first
  end
  
end
