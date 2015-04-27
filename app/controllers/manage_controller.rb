class ManageController < ApplicationController

  def edit
    @product = Product.find(params[:id])
  end

  def products
    @products = Product.all
  end

  def update 
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to products_path
  end

  private 

  def product_params
    parms.require(:product).permit(:name, :price, :description)
  end

end
