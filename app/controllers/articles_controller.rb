class ArticlesController < ApplicationController
  def new
    @article = Article.new
    render :new
  end

  def index
    @articles = Article.all.order('created_at DESC')
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

  private

  def article_params
    params.require(:article).permit(:link, :text)
  end
end
