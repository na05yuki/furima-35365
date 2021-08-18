require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入が上手くいく時' do
      it "全ての値(building_name以外)が存在すれば購入できる" do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入が上手くいかない時' do
      it "zip_codeが空では購入ができないこと" do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it "zip_codeにハイフン(-)がないと購入ができないこと" do
        @order_address.zip_code = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'prefectureが未選択だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入ができないこと" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では購入ができないこと" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では購入ができないこと" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが11桁以上では購入ができないこと" do
        @order_address.phone_number = '0901234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it "phone_numberが数字以外が含まれると購入ができないこと" do
        @order_address.phone_number = '09012345678a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end

end
