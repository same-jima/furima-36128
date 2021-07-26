require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do

    context '新規登録/ユーザー情報' do
      # ニックネームが必須であること。
      it 'ニックネームが必須' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      # メールアドレスが必須であること。
      it 'メールアドレスが必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      # メールアドレスが一意性であること。
      it 'メールアドレスが一意性' do
        @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      #メールアドレスは、@を含む必要があること。
      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'test.testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      # パスワードが必須であること。
      it 'パスワードが必須' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      # パスワードは、6文字以上での入力が必須であること
      it 'パスワードは、6文字以上での入力が必須' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      # パスワードは、半角英数字混合での入力が必須であること
      it 'パスワードは、半角英数字混合での入力が必須' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字混合にしてください"
      end
      # パスワードとパスワード（確認）は、値の一致が必須であること。
      it 'パスワードとパスワード（確認）は、値の一致が必須' do
        @user.password = "123456"
        @user.password_confirmation = "112345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end

    context '新規登録/本人情報確認' do
      #お名前(全角)は、名字と名前がそれぞれ必須であること。
      it 'お名前(全角)は、名字と名前がそれぞれ必須' do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", "First name can't be blank"
      end
      #お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須' do
        @user.first_name = 'tarou'
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角で入力してください", "First name 全角で入力してください"
      end
      #お名前カナ(全角)は、名字と名前がそれぞれ必須であること。
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須' do
        @user.first_name_kana = ''
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank", "First name kana can't be blank"
      end
      #お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須' do
        @user.first_name_kana = 'a'
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角(カタカナ)で入力してください", "First name kana 全角(カタカナ)で入力してください"
      end
      #生年月日が必須であること。
      it '生年月日が必須' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end

    
  end
end
