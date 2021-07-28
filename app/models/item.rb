class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :area
  belongs_to :delivery_day

  with_options presence: true do
    validates :title, :text, :price
    validates :category_id, :condition_id, :delivery_id, :delivery_day_id, :area_id, 
    numericality: {other_than: 1 , message: "can't be blank"}
  end
end
