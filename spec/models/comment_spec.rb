require 'rails_helper'

describe Comment do
  
  context "when a comment is created" do
    
    before do
      @user = FactoryGirl.create(:user)
      @product = FactoryGirl.create(:product)
    end
    
    it "is not valid without a body" do
      comment1 = Comment.create(user_id: @user.id, rating: 3, product_id: @product.id)
      expect(comment1).not_to be_valid
    end
    
    it "is not valid without a rating" do
      comment2 = Comment.create(user_id: @user.id, body: "This is great", product_id: @product.id)
      expect(comment2).not_to be_valid
    end
    
    it "is valid when it has a body and a rating" do
      comment3 = Comment.create(user_id: @user.id, body: "This is awesome", rating: 3, product_id: @product.id)
      expect(comment3).to be_valid
    end
    
  end

end