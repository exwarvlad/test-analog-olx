class UsersController < ApplicationController
  # задаю объект @user для шаблонов и экшенов
  before_action :set_current_user, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('activerecord.controllers.user.updated')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :phone)
  end

  def set_current_user
    @user = current_user
  end
end
