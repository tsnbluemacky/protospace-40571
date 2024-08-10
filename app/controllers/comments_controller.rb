class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to prototype_path(@prototype), notice: 'コメントが投稿されました。'
    else
      @comments = @prototype.comments.includes(:user)
      render "prototypes/show"
    end
  end

  def destroy
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to prototype_path(@prototype), notice: 'コメントが削除されました。'
    else
      redirect_to prototype_path(@prototype), alert: 'コメントの削除権限がありません。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

