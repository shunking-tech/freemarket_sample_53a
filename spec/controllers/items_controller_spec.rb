require 'rails_helper'

describe ItemsController do

  # データ作成
  def create_data
    # テスト用DBにデータを保存
    user = create(:user)
    create(:category)
    create(:size)
    item = create(:item)
    # itemとuserをハッシュにして返す
    return {item: item, user: user}
  end

  describe '商品詳細' do
    let(:data) { create_data }

    context 'ログイン時' do
      before do
        login_user data[:user]
        get :show, params: { id: data[:item] }
      end

      # 一旦保留
      # it 'assigns @item_comment' do
      #   expect(assigns(:item_comment)).to be_a_new(ItemComment)
      # end

      it 'itemインスタンス変数とテストデータが同じかどうか' do
        expect(assigns(:item)).to eq data[:item]
      end

      it 'ビューがshowファイルかどうか' do
        expect(response).to render_template :show
      end
    end

    context 'ログアウト時' do
      before do
        get :show, params: { id: data[:item] }
      end

      # 一旦保留
      # it 'assigns @item_comment' do
      #   expect(assigns(:item_comment)).to be_a_new(ItemComment)
      # end

      it 'itemインスタンス変数とテストデータが同じかどうか' do
        expect(assigns(:item)).to eq data[:item]
      end

      it 'ビューがshowファイルかどうか' do
        expect(response).to render_template :show
      end
    end

  end

  describe '商品削除' do
    let(:data) { create_data }

    before do
      login_user data[:user]
      delete :destroy, params: { id: data[:item] }
    end

    it "削除されたかどうかを確認" do
      expect{Item.find(data[:item][:id])}.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it "マイページに遷移するかどうかを確認" do
      expect(response).to redirect_to(user_path(data[:user]))
    end

  end
end

# bundle exec rspec spec/controllers/items_controller_spec.rb
