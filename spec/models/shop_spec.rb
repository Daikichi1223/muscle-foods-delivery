require 'rails_helper'
describe Shop do
  before do
    @shop = FactoryBot.build(:shop)
  end

  describe '店舗新規登録' do
    context '新規登録がうまくいく時' do
      it 'nameとemail、password、password_confirmation、phone_number、postal_code、area_id、city、addressが存在すれば登録できる' do
        expect(@shop).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で且つ、一致していれば登録できる' do
        @shop.password = 'a00000'
        @shop.password_confirmation = 'a00000'
        expect(@shop).to be_valid
      end
    end
    
    context '新規登録がうまくいかない時' do
      it 'nameが空だと登録できない' do
        @shop.name = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("店舗名を入力してください")
      end
      it 'emailが空だと登録できない' do
        @shop.email = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@が存在しない場合は登録できない' do
        @shop.email = "test.com"
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '重複したemailが存在する場合登録できない' do
        @shop.save
        another_shop = FactoryBot.build(:shop)
        another_shop.email = @shop.email
        another_shop.valid?
        expect(another_shop.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空だと登録できない' do
        @shop.password = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @shop.password = "123456"
        @shop.valid?
        expect(@shop.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'passwordが5文字以下だと登録できない' do
        @shop.password = "a1234"
        @shop.valid?
        expect(@shop.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @shop.password = "a12345"
        @shop.password_confirmation = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'phone_numberが空だと登録できない' do
        @shop.phone_number = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'postal_codeが空だと登録できない' do
        @shop.postal_code = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeにハイフンが含まれていないと登録できない' do
        @shop.postal_code = "1111111"
        @shop.valid?
        expect(@shop.errors.full_messages).to include("郵便番号をハイフンを含めて入力してください")
      end
      it 'area_idが1だと登録できない' do
        @shop.area_id = "1"
        @shop.valid?
        expect(@shop.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと登録できない' do
        @shop.city = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("市区町村名を入力してください")
      end
      it 'addressが空だと登録できない' do
        @shop.address = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("番地を入力してください")
      end
    end
  end
end