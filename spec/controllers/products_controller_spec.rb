require 'rails_helper'

describe ProductsController, type: :controller do
  #let(:product) {Product.create!(name:"Triceratops")}
  
  context "GET #index" do
    it "renders all products" do
      get :index
      expect(response).to be_ok
    end
  end
  
  context "POST #create" do
    before do
      @product1 = FactoryGirl.build(:product, name: "")
    end
    
    it "is not valid without a name" do
      expect(@product1).not_to be_valid
    end
  end
  
  context "PATCH/PUT #update" do
    before do
      @user1 = FactoryGirl.create(:user)
      @admin1 = FactoryGirl.create(:admin)
      @product2 = FactoryGirl.create(:product)
    end
    
    it "is not updated if user is not logged in" do
      patch :update, id: @product2.id, product: attributes_for(:product, name: "NewName")
      @product2.reload
      expect(response).to redirect_to(root_path)
    end
    
    it "is not updated if user is not an admin" do
      sign_in @user1
      patch :update, id: @product2.id, product: attributes_for(:product, name: "NewName")
      @product2.reload
      expect(response).to redirect_to(root_path)
    end
    
    it "is updated if user is an admin" do
      sign_in @admin1
      patch :update, id: @product2.id, product: attributes_for(:product, name: "NewName")
      @product2.reload
      expect(@product2.name).to eq("NewName")
    end
  end
  
  context "DELETE #destroy" do
    before do
      @user2 = FactoryGirl.create(:user)
      @admin2 = FactoryGirl.create(:admin)
      @product3 = FactoryGirl.create(:product)
    end
    
    it "is not deleted if user is not logged in" do
      delete :destroy, id: @product3.id
      expect(response).to redirect_to(root_path)
    end
    
    it "is not deleted if user is not an admin" do
      sign_in @user2
      delete :destroy, id: @product3.id
      expect(response).to redirect_to(root_path)
    end
    
    it "is deleted if user is an admin" do
      sign_in @admin2
      delete :destroy, id: @product3.id
      expect(response).to redirect_to(products_url)
    end
  end
  
  context "GET #show" do
    it "renders product page" do
      @product = FactoryGirl.create(:product)
      get :show, id: @product.id
      expect(response).to be_ok
    end
  end
end