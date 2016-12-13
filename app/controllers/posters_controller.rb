class PostersController < ApplicationController
  # посылаю не залогиненных пользователей при попытки создания объявления
  before_action :authenticate_user!, only: [:new]

  # задаю объект @poster для экшен show
  before_action :set_poster, only: [:show]

  # задаю объект от текущего юзера @poster для экшен show
  before_action :set_current_user_poster, only: [:edit, :update, :destroy]

  def index
    @posters = Poster.all
    @poster_vip = Poster.all.where(poster_type: "VIP")
  end

  def new
    @poster = current_user.posters.build
  end

  def show

  end

  def create
    @poster = current_user.posters.build(poster_params)

    if @poster.save
      redirect_to @poster, notice: I18n.t('activerecord.controllers.posters.created')
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @poster.update(poster_params)
      redirect_to @poster, notice: I18n.t('activerecord.controllers.posters.updated')
    else
      render :edit
    end
  end

  def destroy
    @poster.destroy
    redirect_to posters_url, notice: I18n.t('activerecord.controllers.posters.destroyed')
  end

  private

  # разрешаю пользователю передавать только нужные параметры
  def poster_params
    params.require(:poster).permit(:title, :price, :poster_type, :poster_photo, :description)
  end

  def set_poster
    @poster = Poster.find(params[:id])
  end

  def set_current_user_poster
    @poster = current_user.posters.find(params[:id])
  end
end
