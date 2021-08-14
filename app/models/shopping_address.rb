class ShoppingAddress < ApplicationRecord
  belongs_to :prefecture
  
  belongs_to :purchase_management
end
