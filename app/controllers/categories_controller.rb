class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to :categories, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to :categories, notice: 'Category updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to :categories, notice: 'Category deleted successfully.'
  end

  private

  def set_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
