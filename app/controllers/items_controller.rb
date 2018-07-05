class ItemsController < ApplicationController
  def create
    item = current_user.items.new(item_params)

    if item.save
      render partial: "items/item", locals: { item: item }, status: 200
    else
      render json: { errors: item.errors.full_messages }, status: 400
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
