object @wishlist
attributes  :name, :is_default, :is_private, :access_hash



child :wished_products do

  attributes  :id
  
  child :variant do
    extends "spree/api/v1/variants/show"
   
    child :product do
        extends "spree/api/v1/products/show"
    end
  end
  
  
end

