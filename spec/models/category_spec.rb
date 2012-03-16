require 'spec_helper'

describe ProductCategory do
  def reset_brand(options = {})
    @valid_attributes = { :name => "foo" }
    @product_category.destroy! if @product_category
    @product_category = ProductCategory.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_brand
  end
  
  context "validations" do
    it "rejects empty name" do
      ProductCategory.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_product
      ProductCategory.new(@valid_attributes).should_not be_valid
    end
  end
end
