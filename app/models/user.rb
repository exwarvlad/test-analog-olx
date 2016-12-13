class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :posters
  has_many :comments

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone, presence: true, length: {in: 5..9}

end
