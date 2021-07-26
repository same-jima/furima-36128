class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :birthday, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角で入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角(カタカナ)で入力してください"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角(カタカナ)で入力してください" }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,message: "は半角英数字混合にしてください"}

end
