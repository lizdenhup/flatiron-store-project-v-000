class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(id: params[:id])
    @items = @category.items
  end

end
