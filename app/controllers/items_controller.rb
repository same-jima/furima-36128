class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      puts = @item.errors.full_messages
      render :new
    end
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :name, :text, :category_id, :condition_id, :delivery_id, :area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
