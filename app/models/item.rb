class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefectures
  belongs_to :days_to_ship

  validates :name, :explanation, :price, presence: true

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefectures_id
    validates :days_to_ship_id
  end

end
