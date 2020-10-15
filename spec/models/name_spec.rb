require 'rails_helper'

RSpec.describe Name, type: :model do
  describe '#create' do
    before do
      @name = FactoryBot.build(:name)
    end

    it "firstname_zenが空では登録できないこと" do
      @name.firstname_zen = nil
      @name.valid?
      expect(@name.errors.full_messages).to include("Firstname zen can't be blank")
    end

    it "firstname_zenに全角漢字、ひらがな、カタカナが使われていなければ登録できないこと" do
      @name.firstname_zen = "123ab"
      @name.valid?
      expect(@name.errors.full_messages).to include("Firstname zen is invalid")
    end
   
    it "lastname_zenが空では登録できないこと" do
      @name.lastname_zen = nil
      @name.valid?
      expect(@name.errors.full_messages).to include("Lastname zen can't be blank")
    end

    it "lastname_zenに全角漢字、ひらがな、カタカナが使われていなければ登録できないこと" do
      @name.lastname_zen = "123ab"
      @name.valid?
      expect(@name.errors.full_messages).to include("Lastname zen is invalid")
    end

    it "firstname_kanaが空では登録できないこと" do
      @name.firstname_kana = nil
      @name.valid?
      expect(@name.errors.full_messages).to include("Firstname kana can't be blank")
    end

    it "firstname_kanaに全角カタカナ意外が使われて入れば登録できること" do
      @name.firstname_zen = "123abあ阿"
      @name.valid?
      expect(@name.errors.full_messages).to include("Firstname zen is invalid")
    end
    
    it "lastname_kanaが空では登録できないこと" do
      @name.lastname_kana = nil
      @name.valid?
      expect(@name.errors.full_messages).to include("Lastname kana can't be blank")
    end

    it "lastname_kanaに全角カタカナ意外が使われて入れば登録できること" do
      @name.lastname_zen = "123abあ阿"
      @name.valid?
      expect(@name.errors.full_messages).to include("Lastname zen is invalid")
    end
    
    it "birthdayが空では登録できないこと" do
      @name.birthday = nil
      @name.valid?
      expect(@name.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
