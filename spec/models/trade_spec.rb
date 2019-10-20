require 'rails_helper'

RSpec.describe Trade, type: :model do
  describe '#create' do

    # Tradeのレコード作成に必要なデータを生成
    before do
      @user = create(:user)
      @another_user = create(:user)
      @size = create(:size)
      @category = create(:category)
      @item = create(:item)
    end
    # factory_botが有効かどうかテスト
    it "userを登録できるか" do
      user = @user
      expect(user).to be_valid
    end
    it "another_userを登録できるか" do
      user = @another_user
      expect(user).to be_valid
    end
    it "sizeを登録できるか" do
      size = @size
      expect(size).to be_valid
    end
    it "categoryを登録できるか" do
      category = @category
      expect(category).to be_valid
    end
    it "itemを登録できるか" do
      item = @item
      expect(item).to be_valid
    end


    context '購入可能' do
      it "seller_id, buyer_id, item_id, starusがある場合は購入可能" do
        trade = create(:trade)
        expect(trade).to be_valid
      end
    end


    context '購入不可' do
      it "seller_idがない場合は購入不可" do
        trade = build(:trade, seller_id: nil)
        trade.valid?
        expect(trade.errors[:seller]).to include("を入力してください")
      end
      it "buyer_idがない場合は購入不可" do
        trade = build(:trade, buyer_id: nil)
        trade.valid?
        expect(trade.errors[:buyer]).to include("を入力してください")
      end
      it "seller_idとbuyer_idが同じ場合は購入不可" do
        trade = build(:trade, seller_id: 1, buyer_id: 1)
        trade.valid?
        expect(trade.errors[:seller_id]).to include("が同一人物です")
        expect(trade.errors[:buyer_id]).to include("が同一人物です")
      end
      it "item_idがない場合は購入不可" do
        trade = build(:trade, item_id: nil)
        trade.valid?
        expect(trade.errors[:item]).to include("を入力してください")
      end
      it "statusがない場合は購入不可" do
        trade = build(:trade, status: nil)
        trade.valid?
        expect(trade.errors[:status]).to include("を入力してください")
      end


    end

  end
end

# bundle exec rspec spec/models/trade_spec.rb