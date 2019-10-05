require 'rails_helper'

describe ItemsController do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe 'Get #show' do

    context 'log in' do
      before do
        login_user user
        get :show, params: { id: item }
      end

      # 一旦保留
      # it 'assigns @item_comment' do
      #   expect(assigns(:item_comment)).to be_a_new(ItemComment)
      # end

      it 'assigns @item' do
        expect(assigns(:item)).to eq item
      end

      it 'redners show' do
        expect(response).to render_template :show
      end
    end

    context 'not log in' do
      before do
        get :show, params: { id: item }
      end

      # 一旦保留
      # it 'assigns @item_comment' do
      #   expect(assigns(:item_comment)).to be_a_new(ItemComment)
      # end

      it 'assigns @item' do
        expect(assigns(:item)).to eq item
      end

      it 'redners show' do
        expect(response).to render_template :show
      end

    end
  end
end