class Spree::WishedProductsController < Spree::Api::V1::BaseController

  respond_to :html, :json, :except => [:destroy]

  def create
    @wished_product = Spree::WishedProduct.new(params[:wished_product])
    @wishlist = current_api_user.wishlist

    if @wishlist.include? params[:wished_product][:variant_id]
      @wished_product = @wishlist.wished_products.detect {|wp| wp.variant_id == params[:wished_product][:variant_id].to_i }
    else
      @wished_product.wishlist = current_api_user.wishlist
      @wished_product.save
    end
    
    respond_with(@wished_product)

  end

  def update
    @wished_product = Spree::WishedProduct.find(params[:id])
    @wished_product.update_attributes(params[:wished_product])
    
    respond_with(@wished_product)
  end

  def destroy
    @wished_product = Spree::WishedProduct.find(params[:id])
    @wished_product.destroy
  end
end
