require 'rails_helper'

describe ItemLikesController do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe 'Get #show' do

    describe 'Post #create' do

      context 'log in' do

        before do
          login_user user
        end

        context 'save success' do
          it 'save success with item_like' do
            expect do
              post :create, params: {
                item_id: item.id
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
            item_id: item.id
          }
        end

        it 'redirects to login_path' do
          expect(response).to redirect_to(login_path)
        end
      end
    end

  end
end