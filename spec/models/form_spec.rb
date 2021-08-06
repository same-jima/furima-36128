require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  
  describe '購入機能' do
    context '内容に問題ない場合' do
      it "必須項目があれば保存ができる" do
        expect(@form).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @form.building = ""
        expect(@form).to be_valid
      end
    end
    
    context '内容に問題がある時' do
      it 'tokenが空だと購入できない' do
        @form.token = ""
        @form.valid?
        expect(@form.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空だと購入できない' do
        @form.postal_code = ""
        @form.valid?
        expect(@form.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeは全角では購入できない' do
        @form.postal_code = "１００−０００４"
        @form.valid?
        expect(@form.errors.full_messages).to include "Postal code 郵便番号（ハイフンあり7桁）"
      end
      it 'postal_codeは-(ハイフン)なしでは購入できない' do
        @form.postal_code = "1000004"
        @form.valid?
        expect(@form.errors.full_messages).to include "Postal code 郵便番号（ハイフンあり7桁）"
      end
      it 'area_idが空だと購入できない' do
        @form.area_id = ""
        @form.valid?
        expect(@form.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idが空だと購入できない' do
        @form.area_id = "1"
        @form.valid?
        expect(@form.errors.full_messages).to include "Area can't be blank"
      end
      it 'municipalityが空だと購入できない' do
        @form.municipality = ""
        @form.valid?
        expect(@form.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'municipalityが数値のみだと購入できない' do
        @form.municipality = "1-21-1"
        @form.valid?
        expect(@form.errors.full_messages).to include "Municipality 全角ひらがな、全角カタカナ、漢字"
      end
      it 'municipalityが半角のみだと購入できない' do
        @form.municipality = "ｱｲｳｴｵ123"
        @form.valid?
        expect(@form.errors.full_messages).to include "Municipality 全角ひらがな、全角カタカナ、漢字"
      end
      it 'addressが空だと購入できない' do
        @form.address = ""
        @form.valid?
        expect(@form.errors.full_messages).to include "Address can't be blank"
      end
      it 'addressが数値のみだと購入できない' do
        @form.address = "1-21-1"
        @form.valid?
        expect(@form.errors.full_messages).to include "Address 全角ひらがな、全角カタカナ、漢字"
      end
      it 'addressが半角のみだと購入できない' do
        @form.address = "ｱｲｳｴｵ123"
        @form.valid?
        expect(@form.errors.full_messages).to include "Address 全角ひらがな、全角カタカナ、漢字"
      end
      it 'phone_numが空だと購入できない' do
        @form.phone_num = ""
        @form.valid?
        expect(@form.errors.full_messages).to include "Phone num can't be blank"
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能' do
        @form.phone_num = "0805330"
        @form.valid?
        expect(@form.errors.full_messages).to include "Phone num ハイフンなし10桁or11桁"
      end
      it '電話番号は、-(ハイフン)有りだと保存できない' do
        @form.phone_num = "080-5330-1001"
        @form.valid?
        expect(@form.errors.full_messages).to include "Phone num ハイフンなし10桁or11桁"
      end
    end
  end
end
