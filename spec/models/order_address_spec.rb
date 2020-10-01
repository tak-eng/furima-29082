require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it "user_idとitem_id、post_code、shipping_address_id、city、house_number、building_name、phone_number、order_idが存在すれば登録できること" do
      expect(@order_address).to be_valid
    end

    
  end
end