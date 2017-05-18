class Product < ActiveRecord::Base
    has_many :orders
    
    def self.search(search_term)
      if Rails.env.production?
        Product.where("name ilike ?", "%#{search_term}%")
      else
        Product.where("name LIKE ?", "%#{search_term}%")
      end
      
    end
    
end
