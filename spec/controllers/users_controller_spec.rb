require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:admin)
  end

  describe 'GET #show' do

    context 'User is logged in' do
      before do
        sign_in @user1
      end

      it 'loads correct user details' do
        get :show, id: @user1.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end

      it 'cannot access show page of user2' do
        get :show, id: @user2.id
        expect(response).to have_http_status(302)
        expect(assigns(:user)).not_to eq @user1
        expect(response).to redirect_to(root_path)
      end
    end

    context 'no user is logged in' do
      it 'redirects to sign in' do
        get :show, id: @user1.id
        redirect_to(root_path)
      end
    end

  end
end