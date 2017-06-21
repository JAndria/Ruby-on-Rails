require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) {Product.create!(name:"Triceratops")}
  context "GET #show" do
    it "renders product page" do
      get :show, id: product.id
      expect(response).to be_ok
    end
  end
end