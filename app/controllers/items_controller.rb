class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.order("created_at DESC")
  end

end
