class Form 
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :area_id, :municipality,
  :address, :building, :phone_num

  with_options presence: true do

    validates :item_id, :user_id, :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "郵便番号（ハイフンあり7桁）"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :phone_num, format: {
      with: /\A\d{10,11}\z/, message: "ハイフンなし10桁or11桁" }
    validates :municipality, :address, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
      message: "全角ひらがな、全角カタカナ、漢字"
    }
  end

  

  def save
    item_tag = ItemTag.create(item_id: item_id, user_id: user_id)
    Order.create(
      postal_code: postal_code, area_id: area_id, municipality: municipality,
      address: address, building: building, phone_num: phone_num, item_tag_id: item_tag.id
    )
  end

end