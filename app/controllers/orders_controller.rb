class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only:[:index, :create]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(order_params)
    if @form.valid?
      pay_item
      @form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(
      :postal_code, :area_id, :municipality, :address, :building, :phone_num
    ).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
 end
end
