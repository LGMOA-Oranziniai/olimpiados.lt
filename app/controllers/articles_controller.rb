class ArticlesController < ApplicationController
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @article = Article.friendly.find(params[:title])
    @category = @article.category
  end
end
