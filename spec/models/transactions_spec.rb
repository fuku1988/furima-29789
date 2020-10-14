require 'rails_helper'

RSpec.describe Transactions, type: :model do
  before do
    @transactions = FactoryBot.build(:transactions)
  end
    
  describe "商品が購入できる場合" do
    context "商品が登録される場合" do
      it "全ての値が正しければ保存できること" do
        expect(@transactions).to be_valid
      end
      it "配送先の郵便番号にハイフンが含まれている" do
        @transactions.postal_code = "111-1111"
        @transactions.valid?
        expect(@transactions).to be_valid
      end
      it "建物名は空でも登録ができる" do
        @transactions.buillding_name = ""
        @transactions.valid?
        expect(@transactions).to be_valid
      end
      it "電話番号にハイフンが含まれない" do
        @transactions.phone_number = 11111111111
        @transactions.valid?
        expect(@transactions).to be_valid
      end
      it "電話番号が11桁以内であること" do
        @transactions.phone_number = 111111111
        @transactions.valid?
        expect(@transactions).to be_valid
      end
    end
    
    context "商品が購入できない場合" do
      it "tokenが空の場合" do
        @transactions.token = nil
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Token can't be blank")
      end
      it "配送先の郵便番号が入力されていない場合" do
      end
      it "配送先の郵便番号にハイフンがない場合" do
        @transactions.postal_code = "1111111"
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Postal code is invalid")
      end
      it "配送先の郵便番号にハイフンがなく場合ハイフン含め8文字以上の場合" do
        @transactions.postal_code = "111-11111"
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Postal code is invalid")
      end
      it "配送先の郵便番号の数字がハイフン含め7文字の場合" do
        @transactions.postal_code = "111-111"
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Postal code is invalid")
      end
      it "配送先の郵便番号にアルファベットが登録された場合" do
        @transactions.postal_code = "aaa-aaaaa"
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Postal code is invalid")
      end
      it "配送先の郵便番号に文字が登録された場合" do
        @transactions.postal_code = "山田太郎"
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Postal code is invalid")
      end
      it "配送先の都道府県を---以外を選択た場合" do
        @transactions.prefecture_id = 1
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Prefecture can't be blank.")
      end
      it "配送先の市区町村が入力されていない場合" do
        @transactions.city = ""
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("City can't be blank")
      end
      it "配送先の番地が入力されていない場合" do
        @transactions.house_number = ""
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が登録されていない場合" do
        @transactions.phone_number = ""
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にハイフンが含まれる場合" do
        @transactions.phone_number = 11-1111-1111
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が11桁以上の場合" do
        @transactions.phone_number = 111111111111
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号がアルファベットが登録された場合" do
        @transactions.phone_number = "aaaaaaaaaa"
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号に文字が登録された場合" do
        @transactions.phone_number = "山田太郎"
        @transactions.valid?
        expect(@transactions.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end