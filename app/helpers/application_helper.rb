module ApplicationHelper

  # Возвращает путь к аватарке данного юзера
  # Если у пользователя есть его личная, возвращает её, иначе стандартную
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.jpg')
    end
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
        (model.user == current_user || # если у модели есть юзер и он залогиненный
            # пробуем у модели взять .poster и если он есть, проверяем его юзера
            (model.try(:poster).present? && model.poster.user == current_user))
  end

end
