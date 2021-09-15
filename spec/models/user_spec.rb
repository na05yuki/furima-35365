require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録が上手く行く時' do
        it 'nicknameとemail、passwordとpassword_confiramation,family_name,first_name,family_name_kana,first_name_kana,birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが６文字以上の半角英数字混合であれば登録できる' do
          @user.password = '000aaa'
          @user.password_confirmation = '000aaa'
          expect(@user).to be_valid
        end
        it 'family_nameが全角文字であれば登録できる' do
          @user.family_name = '山田'
          expect(@user).to be_valid
        end
        it 'first_nameが全角文字であれば登録できる' do
          @user.first_name = '太郎'
          expect(@user).to be_valid
        end
        it 'family_name_kanaが全角カナであれば登録できる' do
          @user.family_name_kana = 'ヤマダ'
          expect(@user).to be_valid
        end
        it 'first_name_kanaが全角カナであれば登録できる' do
          @user.first_name_kana = 'タロウ'
          expect(@user).to be_valid
        end
      end

      context '新規登録が上手くいかない時' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームを入力してください')
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールを入力してください')
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードを入力してください')
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '00aaa'
          @user.password_confirmation = '00aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end
        it 'passwordは半角英字のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
        end
        it 'passwordは半角数字のみでは登録できない' do
          @user.password = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
        end
        it 'passwordは全角では登録できない' do
          @user.password = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
        end

        it 'family_nameが空だと登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字を入力してください')
        end
        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('氏名を入力してください')
        end

        it 'family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.family_name = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字は全角（漢字・ひらがな・カタカナ）で入力してください')
        end
        it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.first_name = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('氏名は全角（漢字・ひらがな・カタカナ）で入力してください')
        end

        it 'family_name_kanaが空だと登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字フリガナを入力してください')
        end
        it 'first_name_kanaが空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('氏名フリガナを入力してください')
        end
        it 'family_name_kanaが全角カタカナでなければ登録できない' do
          @user.family_name_kana = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字フリガナは全角カタカナで入力してください')
        end
        it 'first_name_kanaが全角カタカナでなければ登録できない' do
          @user.first_name_kana = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('氏名フリガナは全角カタカナで入力してください')
        end
      end
    end
  end
end
