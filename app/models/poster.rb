class Poster < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  mount_uploader :poster_photo, PosterPhotoUploader

  POSTER_TYPE = [
      "VIP",
      "Детский мир",
      "Животные",
      "Мода и стиль",
      "Недвижимость",
      "Транспорт",
      "Электроника"
  ]

  validates :poster_type, inclusion: { in: POSTER_TYPE ,
            message: "Объявление имеет не допустимое значение" }
end
