class Spree::WishlistsController < Spree::Api::V1::BaseController
  helper 'spree/products'

  respond_to :html, :json, :js
  #respond_to :js, :only => [:update]

  def new
    @wishlist = Spree::Wishlist.new

    render 'show'
  end

  def index
    @wishlists = current_api_user.wishlists

    respond_with(@wishlists)
  end
  
  def edit
    @wishlist = Spree::Wishlist.find_by_access_hash(params[:id])

    render 'show'
  end

  def update
    @wishlist = Spree::Wishlist.find_by_access_hash(params[:id])
    @wishlist.update_attributes(params[:wishlist])

    render 'show'
  end

  def show
    @wishlist = Spree::Wishlist.find_by_access_hash(params[:id])

    respond_with(@wishlist)
  end
  
  def default
    @wishlist = current_api_user.wishlist
    render 'show'
  end
  
  def create
    @wishlist = Spree::Wishlist.new(params[:wishlist])
    @wishlist.user = current_api_user

    @wishlist.save
    render 'show'
  end

  def destroy
    @wishlist = Spree::Wishlist.find_by_access_hash(params[:id])
    @wishlist.destroy
    respond_with(@wishlist )do |format|
      format.html { redirect_to account_path }
    end
  end

end
