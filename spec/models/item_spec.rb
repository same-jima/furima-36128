require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品出品できる時' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存される' do
        @item = FactoryBot.build(:item)
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it '商品画像を1枚つけることが必須である' do
        @item.image= nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が必須である' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が必須である' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'カテゴリーの情報が必須である' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーは、「---、メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他」の11項目が表示されること（--- は初期値として設定すること）' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の情報が必須である' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '商品の状態は、「---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪い」の7項目が表示されること（--- は初期値として設定すること）' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担の情報が必須である' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it '配送料の負担は、「---、着払い(購入者負担)、送料込み(出品者負担)」の3項目が表示されること（--- は初期値として設定すること）' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it '発送元の地域の情報が必須である' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送元の地域は、「---」と47都道府県の合計48項目が表示されること（--- は初期値として設定すること）' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送までの日数の情報が必須である' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it '発送までの日数は、「---、1~2日で発送、2~3日で発送、4~7日で発送」の4項目が表示されること（--- は初期値として設定すること）' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it '価格の情報が必須である' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格は、¥300~¥9,999,999の間のみ保存可能である' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300~¥9999999(半角数字)の入力"
      end
      it '価格は、¥300~¥9,999,999の間のみ保存可能である' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300~¥9999999(半角数字)の入力"
      end
      it '価格は半角数値のみ保存可能である' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300~¥9999999(半角数字)の入力"
      end     
      it '価格は半角英字のみだと保存できないこと' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300~¥9999999(半角数字)の入力"
      end
      it '価格は半角英数字のみだと保存できないこと' do
        @item.price = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300~¥9999999(半角数字)の入力"
      end

      it '価格は全角数字だと保存できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price ¥300~¥9999999(半角数字)の入力"
      end

    end


  end
end
