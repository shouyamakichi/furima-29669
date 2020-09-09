require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
    context '新規投稿がうまくいくとき'do
      it "nicknameとemail、passwordとpassword_confirmation,last_nameとfirst_name,last_name_kanaとfirst_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上の半角英数であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end

      it "last_nameが全角ならば登録できる" do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end

      it "fist_nameが全角ならば登録できる" do 
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end

      it "last_name_kanaが全角カナであれば登録できる" do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角カナであれば登録できる" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "重複したnicknameが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nickname has already been taken")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが数字のみであれば登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end

      it "passwordが英字のみであれば登録できない" do
        @user.password = "aaaaaa"
        @user_password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameが半角英数であれば登録できない" do
        @user.last_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Last name Full-width characters")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが半角英数であれば登録できない" do
        @user.last_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Last name Full-width characters")
      end

      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "bithdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end     
    end     
  end
end
