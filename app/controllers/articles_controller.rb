class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC').page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def show
    @article = get_article
    @comments = @article.comments.order('created_at ASC').page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  private

  def get_article
    Article.find(params[:id])
  end

end
