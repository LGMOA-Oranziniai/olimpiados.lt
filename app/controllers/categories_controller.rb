class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:name])
    puts @category
    @articles = @category.articles.paginate(:page => params[:page], :per_page => 30)
  end
end
