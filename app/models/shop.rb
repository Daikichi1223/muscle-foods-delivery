class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  has_many :meals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do 
    validates :name
    validates :phone_number
    validates :postal_code
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :address
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "には英字と数字の両方を含めて設定してください"
      
  validates :area_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'をハイフンを含めて入力してください' }
end