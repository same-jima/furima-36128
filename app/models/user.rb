class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :name, :birthday
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/,message: "全角で入力してください" }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角(カタカナ)で入力してください"}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,message: "は半角英数字混合にしてください"}
  end
end
