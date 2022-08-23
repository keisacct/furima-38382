class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @items = Item.all.order(created_at: "DESC")
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        if @item.save
            redirect_to root_path
        else
            render :new
        end
    end

    private
    def item_params
        params.require(:item).permit(:image, :title, :description, :price, 
            :category_id, :quality_id, :postage_id, :prefecture_id, 
            :shipping_day_id).merge(user_id: current_user.id)
    end
end
