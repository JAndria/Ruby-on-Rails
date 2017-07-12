class StaticPagesController < ApplicationController
  def index
    
  end
  
  def landing_page
    @featured_product = Product.first
    @products = Product.limit(4)
    if $redis.exists("sitecounter") == 0
      $redis.set("sitecounter", 1)
    else
      $redis.incr("sitecounter")
    end
  end
  
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
