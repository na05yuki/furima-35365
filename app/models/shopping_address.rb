class ShoppingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
  belongs_to :purchase_management
end
