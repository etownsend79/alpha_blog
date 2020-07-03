class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was edited successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy

    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end

  private

  def set_article
    @article = rticle.find(params[:id])
  end
end
