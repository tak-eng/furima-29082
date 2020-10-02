require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it "user_idとitem_id、post_code、shipping_address_id、city、house_number、building_name、phone_number、order_idが存在すれば登録できること" do
      expect(@order_address).to be_valid
    end

    it "user_idが空では登録できないこと" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では登録できないこと" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が空では登録できないこと" do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end

    it "郵便番号にハイフンが無ければ登録できないこと" do
      @order_address.post_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid")
    end

    it "都道府県名が空では登録できないこと" do
      @order_address.shipping_address_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping address can't be blank")
    end
    
    it "市町村名が空では登録できないこと" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空では登録できないこと" do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it "電話番号が空では登録できないこと" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号にハイフンがあると登録できないこと" do
      @order_address.phone_number = "090-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号に数字以外があると登録できないこと" do
      @order_address.phone_number = "aａｱアあ阿"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end