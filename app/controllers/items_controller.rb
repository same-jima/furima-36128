class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :redirect_index, onjy: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = Item.includes(:user)
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
    
  def destroy
    @item.destroy
    redirect_to root_path
  end
    
  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :delivery_id, :area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path if @item.item_tag.present? && current_user.id == @item.user_id
  end

  def redirect_index
    if @item_tag.present? == true
      redirect_to root_path
    end
  end

  
  
end
