require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation、firstname_zenとlastname_zen、firstname_kanaとlastname_kana、誕生日が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "重複したnicknameが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, nickname: @user.nickname)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Nickname has already been taken")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "firstname_zenが空では登録できないこと" do
      @user.firstname_zen = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname zen can't be blank")
    end
   
    it "lastname_zenが空では登録できないこと" do
      @user.lastname_zen = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname zen can't be blank")
    end

    it "firstname_kanaが空では登録できないこと" do
      @user.firstname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
   
    it "lastname_kanaが空では登録できないこと" do
      @user.lastname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
    end
    
    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
