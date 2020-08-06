class ArticlesController < ApplicationController
  def new
    @article = Article.new
    render :new
  end

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).order('created_at DESC') if params[:tag]
    else
      @articles = Article.order('created_at DESC')
    end
    render :index
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article&.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:link, :text, :tag_list)
  end
end
