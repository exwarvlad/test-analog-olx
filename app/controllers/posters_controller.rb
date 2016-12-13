class PostersController < ApplicationController
  # посылаю не залогиненных пользователей при попытки создания объявления
  before_action :authenticate_user!, only: [:new]

  # задаю объект @poster для экшен show
  before_action :set_poster, only: [:show]

  # задаю объект от текущего юзера @poster для экшен show
  before_action :set_current_user_poster, only: [:edit, :update, :destroy]

  def index
    @posters = Poster.all
    @poster_vip = get_posters_category("VIP")
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

  # экшены категорий объявлений
  def childrens_world
    @poster_children_world = get_posters_category("Детский мир")
  end

  def animals
    @poster_animals = get_posters_category("Животные")
  end

  def fashion_and_style
    @poster_fashion_and_style = get_posters_category("Мода и стиль")
  end

  def property
    @poster_property = get_posters_category("Недвижимость")
  end

  def transport
    @poster_transport = get_posters_category("Транспорт")
  end

  def electronics
    @poster_electronics = get_posters_category("Электроника")
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

  # метод возвращает все объявления с указанной категорией
  def get_posters_category(type)
    Poster.all.where(poster_type: type)
  end
end
