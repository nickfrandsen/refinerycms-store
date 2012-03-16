module Admin
  class ProductCategoriesController < Admin::BaseController
    crudify :product_category,
      :title_attribute => 'name',
      :order => 'name ASC',
      :redirect_to_url => 'admin_products_url'

    def create
      @product_category = ProductCategory.new(params[:product_category])
      @product_category.save

      respond_to do |format|
        format.js { @product_category }
      end
    end

    def destroy
      @product_category = ProductCategory.destroy_category params
      if @product_category.try(:destroyed?)
        flash[:notice] = "Category \"#{@category.name}\" has been deleted"
      else
        flash[:notice] = "Seems like the category doesn't exist"
      end
    end
  end
end