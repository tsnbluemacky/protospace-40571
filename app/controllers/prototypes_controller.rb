class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'プロトタイプが作成されました。'
    else
      flash.now[:alert] = 'プロトタイプの作成に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'プロトタイプが更新されました。'
    else
      flash.now[:alert] = 'プロトタイプの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    logger.debug "Attempting to delete prototype with id: #{@prototype.id}"
    if @prototype.destroy
      logger.debug "Prototype deleted successfully"
      flash[:notice] = 'プロトタイプが削除されました。'
    else
      logger.debug "Failed to delete prototype"
      flash[:alert] = 'プロトタイプの削除に失敗しました。'
    end
    redirect_to root_path
  end

  private

  def set_prototype
    logger.debug "Params ID: #{params[:id]}"  # パラメータの確認用ログ
    @prototype = Prototype.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "プロトタイプが見つかりません"
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def correct_user
    redirect_to prototypes_path, notice: '権限がありません' unless @prototype.user == current_user
  end
end