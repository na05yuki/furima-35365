class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :explanation, :price, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 


end
