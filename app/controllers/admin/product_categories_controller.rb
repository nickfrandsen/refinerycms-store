module Admin
  class ProductCategoriesController < Admin::BaseController

    before_filter :ensure_not_referenced_by_any_product, :only => :destroy

    crudify :product_category,
      :title_attribute => 'name',
      :order => 'position ASC',
      :xhr_paging => true

    def create
      @product_category = ProductCategory.new(params[:product_category])
      @product_category.save

      respond_to do |format|
        format.html { redirect_to admin_product_categories_path }
        format.js
      end
    end

    def ensure_not_referenced_by_any_product
      if @product_category.products.count.zero?
        return true
      else
        flash[:message] = "This category is in use"
        return false
      end
    end

  end
end