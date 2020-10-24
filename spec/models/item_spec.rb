require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.images << fixture_file_upload('public/images/test_image.png')
    end

    it "imagesとname、text、price、user、category_id、item_condition_id、shipping_cost_id、shipping_address_id、delivery_date_idが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "出品画像が空では登録できないこと" do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("出品画像を入力してください")
    end

    it "商品名が空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it "商品説明が空では登録できないこと" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it "価格が空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end

    it "価格は半角数字以外では登録できないこと" do
      @item.price = "あｱアｱ阿ａa"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
    end

    it "価格の範囲が300未満では登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
    end   
    
    it "価格の範囲が9999999より大きければ登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
    end   

    it "ログイン中のユーザーではないと登録できないこと" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end

    it "カテゴリーが選択されていないと登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは0以外の値にしてください")
    end

    it "商品状態が選択されていないと登録できないこと" do
      @item.item_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は0以外の値にしてください")
    end

    it "配送料の負担が選択されていないと登録できないこと" do
      @item.shipping_cost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は0以外の値にしてください")
    end
    
    it "発送元の地域が選択されていないと登録できないこと" do
      @item.shipping_address_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元の地域は0以外の値にしてください")
    end

    it "発送日までの日数が選択されていないと登録できないこと" do
      @item.delivery_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は0以外の値にしてください")
    end
  end
end
