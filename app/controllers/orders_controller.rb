class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

    def index
      @orders = Order.where("user_id = ?", current_user.id)
    end
    
    def show
    end
    
    def new
    end
    
    def create
    end
    
    def destroy
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total)
    end

end