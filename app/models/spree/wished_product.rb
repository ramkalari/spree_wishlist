class Spree::WishedProduct < ActiveRecord::Base
  belongs_to :variant
  belongs_to :wishlist
  
  attr_accessible :id, :wishlist_id, :variant, :variant_id

end
