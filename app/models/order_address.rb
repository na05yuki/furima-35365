class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :address, :building_name, :phone_number,
                :purchase_management_id, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含め入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'を11桁以内の数字で入力してください' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase_management = PurchaseManagement.create(item_id: item_id, user_id: user_id)

    ShoppingAddress.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address,
                           building_name: building_name, phone_number: phone_number, purchase_management_id: purchase_management.id)
  end
end
