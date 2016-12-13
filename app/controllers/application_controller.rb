class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name, :email, :avatar
    ])
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
        (model.user == current_user || # если у модели есть юзер и он залогиненный
            # пробуем у модели взять .poster и если он есть, проверяем его юзера
            (model.try(:poster).present? && model.poster.user == current_user))
  end

end
