require 'rails_helper'

describe ItemsController do

  describe '商品削除' do

    # 削除するためのレコードを作成
    def create_data
      # テスト用DBにデータを保存
      user = create(:user)
      create(:category)
      create(:size)
      item = create(:item)
      # マイページにリダイレクトできるように擬似的にログインする
      login_user user
      # itemとuserをハッシュにして返す
      return {item: item, user: user}
    end

    it "削除されたかどうかを確認" do
      # 削除するためのレコードを作成
      item = create_data[:item]
      # 擬似的にdestroyアクションを動かすリクエスト
      delete :destroy, params: {  id: item.id }
      # 削除したitemのidのレコードが存在しないことを確認
      expect{Item.find(item.id)}.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it "マイページに遷移するかどうかを確認" do
      # 削除するためのレコードを作成
      data = create_data
      item = data[:item]
      user = data[:user]
      # 擬似的にdestroyアクションを動かすリクエスト
      delete :destroy, params: {  id: item.id }
      # マイページに遷移するかどうかを確認
      expect(response).to redirect_to(user_path(user))
    end

  end
end

# bundle exec rspec spec/controllers/items_controller_spec.rb