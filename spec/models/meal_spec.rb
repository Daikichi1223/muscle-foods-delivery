require 'rails_helper'

describe Meal do
  before do
    @meal = FactoryBot.build(:meal)
  end

  describe '料理登録機能' do
    context '料理の登録がうまくいく時' do
      it "image、name、explanation、genre_id、protein、fat、carboとpriceが存在すれば出品できる" do
        expect(@meal).to be_valid
      end
      it "nameが40文字以下で登録できる" do
        @meal.name = "aaaaa"
        expect(@meal).to be_valid
      end
      it "explanationが1000文字以下で登録できる" do
        @meal.explanation = "aaaaa"
        expect(@meal).to be_valid
      end
      it "価格が1円以上で登録できる" do
        @meal.price = "300"
        expect(@meal).to be_valid
      end
      it "価格が9,999,999円以下で登録できる" do
      @meal.price = "9999999"
      expect(@meal).to be_valid
      end
    end

    context '料理の登録がうまくいかない時' do
      it "imageが未選択であれば登録できない" do
        @meal.image = nil
        @meal.valid?
        expect(@meal.errors.full_messages).to include("料理画像を選択してください")
      end
      it "nameが空であれば登録できない" do
        @meal.name = ""
        @meal.valid?
        expect(@meal.errors.full_messages).to include("料理名を入力してください")
      end
      it "nameが41文字以上であれば登録できない" do
        @meal.name = "a" * 41
        @meal.valid?
        expect(@meal.errors.full_messages).to include("料理名は40文字以内で入力してください")
      end
      it "explanationが1001文字以上であれば登録できない" do
        @meal.explanation = "a" * 1001
        @meal.valid?
        expect(@meal.errors.full_messages).to include("料理概要は1000文字以内で入力してください")
      end
      it "genre_idが1であれば出品できない"do
        @meal.genre_id = "1"
        @meal.valid?
        expect(@meal.errors.full_messages).to include("ジャンルを選択してください")
      end
      it "proteinが空であれば登録できない" do
        @meal.protein = ""
        @meal.valid?
        expect(@meal.errors.full_messages).to include("タンパク質量を入力してください")
      end
      it "fatが空であれば登録できない" do
        @meal.fat = ""
        @meal.valid?
        expect(@meal.errors.full_messages).to include("脂質量を入力してください")
      end
      it "carboが空であれば登録できない" do
        @meal.carbo = ""
        @meal.valid?
        expect(@meal.errors.full_messages).to include("炭水化物量を入力してください")
      end
      it "priceが空であれば登録できない" do
        @meal.price = ""
        @meal.valid?
        expect(@meal.errors.full_messages).to include("値段を入力してください")
      end
      it "priceが全角数字だと登録できない" do
        @meal.price = "３００"
        @meal.valid?
        expect(@meal.errors.full_messages).to include("値段は半角数字で入力してください")
      end
      it "priceが0円だと登録できない" do
        @meal.price = "0"
        @meal.valid?
        expect(@meal.errors.full_messages).to include("値段は1円~9,999,999円の範囲で入力してください")
      end
      it "priceが10,000,000円以上だと登録できない" do
        @meal.price = "10000000"
        @meal.valid?
        expect(@meal.errors.full_messages).to include("値段は1円~9,999,999円の範囲で入力してください")
      end
    end
  end
end
