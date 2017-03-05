class ArticlesController < ApplicationController
  def index
    @articles = Article.only_visible.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @article = Article.friendly.find(params[:title])
    @category = @article.category
  end
end
