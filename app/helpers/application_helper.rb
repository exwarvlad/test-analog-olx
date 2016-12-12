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

end
