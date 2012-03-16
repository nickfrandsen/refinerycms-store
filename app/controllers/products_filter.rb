module ProductsFilter

  def products!
    if params[:search]
      query = {:name_or_description_contains => params[:search][:query]}
      @products = Product.search(query)
    else
      @resource = params[:resource].to_sym unless params[:resource].nil?
      if @resource
        apply_manual_filters! @resource
        return
      end

      @products = Product.order(sort_condition)
      apply_dynamic_filters! :products
    end

    @products = @products.paginate(:page => params[:page], :per_page => 32)
  end
end
