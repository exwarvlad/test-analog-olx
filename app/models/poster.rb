class Poster < ActiveRecord::Base
  belongs_to :user

  POSTER_TYPE = [
      "VIP",
      "Детский мир",
      "Животные",
      "Мода и стиль",
      "Недвижимость",
      "Транспорт",
      "Отдам даром"
  ]

  validates :poster_type, inclusion: { in: POSTER_TYPE ,
            message: "Объявление имеет не допустимое значение" }
end
