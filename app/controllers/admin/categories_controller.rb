class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  # t.string   "name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
    private

  def category_params
    params.require(:category).permit(:name)
  end
end
