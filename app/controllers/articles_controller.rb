class ArticlesController < ApplicationController
  before_action :set_article, except: %i[index new create]

  def index
    @articles = Article.all.reverse_order
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
