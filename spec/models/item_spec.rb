require 'rails_helper'
  
RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
  end

  describe "商品登録" do
    context "商品が登録される場合" do
      it "商品名,商品説明,商品画像,カテゴリー,商品の状況,配送料の負担,発送元の地域,発送までの日数,販売価格が存在すれば商品登録ができる" do
        expect(@item).to be_valid
      end
      it "販売価格が300円以上なら登録できる" do
        @item.sales_price = 300
        expect(@item).to be_valid
      end
      it "販売価格が9,999,999以下なら登録できる" do
        @item.sales_price = 9999999
        expect(@item).to be_valid
      end
      it "販売価格が半角数字以下なら登録できる" do
        @item.sales_price = 11111
        expect(@item).to be_valid
      end
      it "画像を複数枚投稿しても登録できる" do
        expect(FactoryBot.build(:item, :more_images)).to be_valid
      end
    end

    context "商品が登録されない場合" do
      it "商品画像が存在しないと登録できない" do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "商品名が存在しないと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品説明が存在しないと登録できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it "カテゴリーを---以外を選択しないと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは --- 以外を選択してください")
      end
      it "商品状況を---以外を選択しないと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は --- 以外を選択してください")
      end
      it "配送料の負担を---以外を選択しないと登録できない" do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は --- 以外を選択してください")
      end
      it "発送元の選択を---以外を選択しないと登録できない" do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元地域は --- 以外を選択してください")
      end
      it "発送までの日数を---以外を選択しないと登録できない" do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は --- 以外を選択してください")
      end
      it "販売価格が存在しないと登録できない" do
        @item.sales_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it "販売価格が300円以下なら登録できない" do
        @item.sales_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it "販売価格が9,999,999以上なら登録できない" do
        @item.sales_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it "販売価格が半角数字以外登録できない" do
        @item.sales_price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
