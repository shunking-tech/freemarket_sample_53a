require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do

    it '商品名(name)が空の時、エラー' do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it '価格(price)が空の時、エラー' do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it '商品説明(description)が空の時、エラー' do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it '商品状態(condition)が空の時、エラー' do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it '取引状況(task)が空の時、エラー' do
      item = build(:item, task: "")
      item.valid?
      expect(item.errors[:task]).to include("を入力してください")
    end

    it '発送料の負担(payer_delivery_expense)が空の時、エラー' do
      item = build(:item, payer_delivery_expense: "")
      item.valid?
      expect(item.errors[:payer_delivery_expense]).to include("を入力してください")
    end

    it '配送の方法(shipping_method)が空の時、エラー' do
      item = build(:item, shipping_method: "")
      item.valid?
      expect(item.errors[:shipping_method]).to include("を入力してください")
    end

    it '発送までの日数(delivery_days)が空の時、エラー' do
      item = build(:item, delivery_days: "")
      item.valid?
      expect(item.errors[:delivery_days]).to include("を入力してください")
    end

    it 'user_idが空の時、エラー' do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    it 'category_idが空の時、エラー' do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it 'size_idが空の時、エラー' do
      item = build(:item, size_id: "")
      item.valid?
      expect(item.errors[:size_id]).to include("を入力してください")
    end

    it 'prefecture_idが空の時、エラー' do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it '画像(item_image)が未選択の時、エラー' do
      item = build(:item)
      item.valid?
      expect(item.errors[:item_images]).to include("を選択してください")
    end

  end
end
