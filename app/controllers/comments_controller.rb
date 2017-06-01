class CommentsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html {redirect_to product_path(@product, tab:"comment", anchor: "tabbed-content"), notice: "Comment was created successfully."}
        format.json { render :show, status: :created, location: @product }
      else
        format.html {redirect_to product_path(@product, tab:"comment", anchor: "tabbed-content"), notice: "Comment was not created successfully."}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  end
  
  private
    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end
  
end