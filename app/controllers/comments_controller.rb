class CommentsController < ApplicationController
  before_action :load_article, :except => :destroy

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article, notice: "Thanks for your comment!"
    else
      redirect_to @article, notice: "Sorry, there's something wrong with your comment"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: "Comment Deleted :("
  end

  private
  def load_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
