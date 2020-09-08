class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
      render 'new'
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

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :product_status_id, :shipping_charges_id, :shipping_region_id, :shipping_day_id,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
