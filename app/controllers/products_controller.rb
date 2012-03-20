class ProductsController < ApplicationController
  helper :rank
  helper :share
  include ProductsFilter
  # include ResourcesFilter

  before_filter :find_page
  before_filter :find_categories

  def index
    @page_title = 'Products'
    @products = Product.order('position desc').paginate({
        :page => params[:page],
        :per_page => RefinerySetting.find_or_set(:products_posts_per_page, 10)
      })
    @current_section = 'products'
    @body_class = 'index'
    present(@page)
  end

  def show
    @product = Product.find(params[:id])
    @body_class = 'single'
    present(@page)
  end
  
  def category
    @product_category = ProductCategory.find(params[:category_id])
    unless @product_category.nil?
      @products = @product_category.products.paginate({
          :page => params[:page],
          :per_page => RefinerySetting.find_or_set(:products_per_page, 10)
        })
    end
    @page_title = "#{@product_category.name.titleize} Products"
    render :template => 'products/index'
  end
  
protected

  def find_page
    @page = Page.where(:link_url => "/products").first
  end
  
  def find_categories
    @product_categories = ProductCategory.with_products
  end
  
end
