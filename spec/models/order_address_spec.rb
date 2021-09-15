require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    sleep 0.1  # エラーを防ぐため記述
  end

  describe '商品購入機能' do
    context '商品購入が上手くいく時' do
      it '全ての値(building_name以外)が存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入が上手くいかない時' do
      it 'user_idが空では購入ができないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Userを入力してください')
      end
      it 'item_idが空では購入ができないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Itemを入力してください')
      end
      it 'zip_codeが空では購入ができないこと' do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'zip_codeにハイフン(-)がないと購入ができないこと' do
        @order_address.zip_code = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はハイフン(-)を含め入力してください')
      end
      it 'prefectureが未選択だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空では購入ができないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市町村を入力してください')
      end
      it 'addressが空では購入ができないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空では購入ができないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'phone_numberが11桁以上では購入ができないこと' do
        @order_address.phone_number = '0901234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を11桁以内の数字で入力してください')
      end
      it 'phone_numberが数字以外が含まれると購入ができないこと' do
        @order_address.phone_number = '09012345678a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を11桁以内の数字で入力してください')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
    end
  end
end
