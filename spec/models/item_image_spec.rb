require 'rails_helper'

RSpec.describe ItemImage, type: :model do
  describe '商品登録' do

    it '画像(image)が空の時、エラー' do
      item_image = build(:item_image, image: "")
      item_image.valid?
      expect(item_image.errors[:image]).to include("を入力してください")
    end

    it 'item_idが空の時、エラー' do
      item_image = build(:item_image, item_id: "")
      item_image.valid?
      expect(item_image.errors[:item_id]).to include("を入力してください")
    end

  end
end
