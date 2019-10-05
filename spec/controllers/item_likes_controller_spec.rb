require 'rails_helper'

describe ItemLikesController do

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

  describe 'いいね機能' do
    let(:data) { create_data }

    describe 'Post #create' do

      context 'log in' do

        before do
          login_user data[:user]
        end

        context 'save success' do
          it 'save success with item_like' do
            expect do
              post :create, params: {
                item_id: data[:item]
              }
            end.to change(ItemLike, :count).by(1)
          end
        end

        context 'save failed' do
          it "don't save item_like" do
            expect do
              post :create, params: {
                item_id: 0
              }
            end.to raise_error(ActiveRecord::RecordNotFound)
          end
        end

      end

      context 'not login' do
        before do
          post :create, params: {
            item_id: data[:item]
          }
        end

        it 'redirects to login_path' do
          expect(response).to redirect_to(login_path)
        end
      end
    end

  end
end