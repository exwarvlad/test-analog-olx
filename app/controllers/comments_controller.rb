class CommentsController < ApplicationController
  before_action :authenticate_user!, expect: [:show, :index]

  # задаю "родительский" poster для коммента
  before_action :set_poster, only: [:create, :destroy]

  # задаю сам коммент
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @poster.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @poster, notice: I18n.t('activerecord.controllers.comments.created')
    else
      render 'posters/show', alert: I18n.t('activerecord.controllers.comments.error')
    end
  end

  def destroy
    message = {notice: I18n.t('activerecord.controllers.comments.destroyed')}

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = {alert: I18n.t('activerecord.controllers.comments.error')}
    end

    redirect_to @poster, message
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_poster
    @poster = Poster.find(params[:poster_id])
  end

  def set_comment
    @comment = @poster.comments.find(params[:id])
  end
end
