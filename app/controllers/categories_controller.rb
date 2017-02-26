class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(alias: params[:alias])
    puts @category
    @articles = @category.articles.paginate(:page => params[:page], :per_page => 30)
  end
end
