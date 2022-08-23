class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :move_to_index, only: :edit
    before_action :find_item, only: [:show, :edit, :update, :destroy]
    
    def index
        @items = Item.all.order(created_at: "DESC")
    end

    def show
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

    def edit
    end

    def update
        @item.update(item_params)
        if @item.save
            redirect_to item_path
        else
            render :edit
        end
    end

    def destroy
        if @item.user_id == current_user.id
            @item.destroy
            redirect_to root_path
        end
    end

    private
    def item_params
        params.require(:item).permit(:image, :title, :description, :price, 
            :category_id, :quality_id, :postage_id, :prefecture_id, 
            :shipping_day_id).merge(user_id: current_user.id)
    end

    def move_to_index
        find_item
        unless @item.user_id == current_user.id
            redirect_to action: :index
        end
    end

    def find_item
        @item = Item.find(params[:id])
    end

end
