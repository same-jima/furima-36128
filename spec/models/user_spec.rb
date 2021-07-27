require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '登録できる時' do
      it '登録できる時' do
        @user = FactoryBot.build(:user)
        expect(@user).to be_valid
      end
    end

    context '登録できない時' do
      it 'ニックネームが必須' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it 'メールアドレスが必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
  
      it 'メールアドレスが一意性' do
        @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
     
      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'test.testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
    
      it 'パスワードが必須' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      
      it 'パスワードは、6文字以上での入力が必須' do
        @user.password = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      
      it 'パスワードは、半角英数字混合での入力が必須' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合にしてください"
      end
      
      it 'パスワードとパスワード（確認）は、値の一致が必須' do
        @user.password = "a12345"
        @user.password_confirmation = "a11234"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '数字のみでは登録できないこと' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合にしてください"
      end

      it '全角では登録できないこと' do
        @user.password = "あいうえおか"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合にしてください"
      end

      
      it 'お名前(全角)は、名字と名前がそれぞれ必須' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'お名前(全角)は、名字と名前がそれぞれ必須' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角で入力してください"
      end

      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角で入力してください"
      end

      
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角(カタカナ)で入力してください"
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角(カタカナ)で入力してください"
      end

      it '生年月日が必須' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
    
  end
end
