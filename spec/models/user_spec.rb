require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user =FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "nicknameとemail,passwordとpassword_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dataが存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "passwordが英数字6文以上であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        @user.valid?
        expect(@user).to be_valid
      end
    end
    
    context "新規登録がうまくいかないとき" do
      it "nicknemeが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "名前の名がない場合登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "名前の姓がない場合登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it "名前の名のカナがない場合登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it "名前の姓のカナがない場合登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end
      it "名前の名のアルファベットを入力した場合登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "名前の姓にアルファベットを入力した場合登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it "名前の名に数字を入力した場合登録できない" do
        @user.last_name = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "名前の姓に数字を入力した場合登録できない" do
        @user.first_name = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it "名前の名のカナにアルファベットを入力した場合登録できない" do
        @user.last_name_kana = "AAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it "名前の姓のカナにアルファベットを入力した場合登録できない" do
        @user.first_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end
      it "名前の名のカナに漢字を入力した場合登録できない" do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it "名前の姓のカナに漢字を入力した場合登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end
      it "名前の名のカナに数字を入力した場合登録できない" do
        @user.last_name_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it "名前の姓のカナに数字を入力した場合登録できない" do
        @user.first_name_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end
      it "名前の名のカナに平仮名を入力した場合登録できない" do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it "名前の姓のカナに平仮名を入力した場合登録できない" do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに@が含まれていないこと" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordは数字だけでは登録できないこと" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordは英語だけでは登録できないこと" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "birth_dateが空では登録できないこと" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end