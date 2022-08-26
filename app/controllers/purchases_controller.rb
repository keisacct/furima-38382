class PurchasesController < ApplicationController
    before_action :find_item, only: [:index, :create, :pay_item]
    before_action :authenticate_user!
    before_action :move_to_index    

    def index
        @purchase = PurchaseAddress.new
    end

    def create
        @purchase = PurchaseAddress.new(purchase_params)
        if @purchase.valid?
            pay_item
            @purchase.save
            return redirect_to root_path
        else
            render :index
        end

    end

    private
    def purchase_params
        params.require(:purchase_address).permit(
            :zipcode, :prefecture_id, :city, :street, :building, :phone_number
        ).merge(
            user_id: current_user.id, token: params[:token], item_id: params[:item_id]
        )
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: @item.price,
            card: params[:token],
            currency: 'jpy'
        )
    end

    def find_item
        @item = Item.find(params[:item_id])
    end

    def move_to_index
        if (user_signed_in? && current_user.id == @item.user_id) || @item.purchase.present?
            redirect_to root_path
        end
    end

end
