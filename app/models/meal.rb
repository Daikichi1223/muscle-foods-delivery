class Meal < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :shop
  has_one_attached :image

  with_options presence: true do 
    validates :image, presence: { message: "を選択してください" }
    validates :name
    validates :explanation
    validates :protein
    validates :fat
    validates :carbo
    validates :price
  end

  validates :genre_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :name, length: { maximum: 40 }
  validates :explanation, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: { in: 1..9999999, message: "は1円~9,999,999円の範囲で入力してください"}
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
end
