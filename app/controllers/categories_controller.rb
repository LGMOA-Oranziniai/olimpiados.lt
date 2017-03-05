class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:name])
    puts @category
    @articles = @category.articles.only_visible.paginate(:page => params[:page], :per_page => 20)
  end
end
