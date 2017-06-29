class ArticlesController < ApplicationController
  def index
    @articles = Article.only_visible.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @article = Article.friendly.find(params[:title])
    @category = @article.category
  end

  def edit
    authenticate_admin_user!

    @article = Article.friendly.find(params[:title])
    @category = @article.category
  end

  def update
    authenticate_admin_user!
    
    @article = Article.friendly.find(params[:title])
    if @article.update_attributes(params.require(:article).permit(:content))
      flash[:success] = "Straipsnis atnaujintas"
      redirect_to @article
    else
      render 'edit'
    end
  end
end
