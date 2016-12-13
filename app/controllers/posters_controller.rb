class PostersController < ApplicationController
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
      redirect_to @poster, I18n.t('activerecord.controllers.posters.created')
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

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
