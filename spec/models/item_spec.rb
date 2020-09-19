require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "imageとname、text、price、user、category_id、item_condition_id、shipping_costs_id、shipping_address_id、delivery_date_idが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "出品画像が空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品説明が空では登録できないこと" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "価格が空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格は半角数字以外では登録できないこと" do
      @item.price = "あｱアｱ阿ａa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "価格の範囲が300未満では登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end   
    
    it "価格の範囲が9999999より大きければ登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end   

    it "ログイン中のユーザーではないと登録できないこと" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end

    it "カテゴリーが選択されていないと登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it "商品状態が選択されていないと登録できないこと" do
      @item.item_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition must be other than 0")
    end

    it "配送料の負担が選択されていないと登録できないこと" do
      @item.shipping_costs_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping costs must be other than 0")
    end
    
    it "発送元の地域が選択されていないと登録できないこと" do
      @item.shipping_address_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping address must be other than 0")
    end

    it "発送日までの日数が選択されていないと登録できないこと" do
      @item.delivery_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date must be other than 0")
    end
  end
end
