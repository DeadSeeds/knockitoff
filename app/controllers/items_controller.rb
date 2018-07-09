class ItemsController < ApplicationController

  before_action :set_item, only: [:update, :destroy]
  respond_to :html, :js

  def create
    item = current_user.items.new(item_params)

    if item.save
      render partial: "items/item", locals: { item: item }, status: 200
    else
      render json: { errors: item.errors.full_messages }, status: 400
    end
  end

  def update
    @item.update_attributes(item_params)
  end

  # def show
  #   @user = current_user
  #   @user.item = Item.find(params[:id])
  # end

  def destroy
    @item.destroy
    @items = current_user.items
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
