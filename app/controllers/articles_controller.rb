class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :edit, :destroy]
  
  http_basic_authenticate_with name: "admin", password: "secret",
    except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @commenter = session[:commenter]
  end

  def index
    @articles = Article.all
  end

  def update
    if @article.update(article_params)
      redirect_to @article 
    else 
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end