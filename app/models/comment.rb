class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :poster

  validates :body, length: {in: 1..255}
end
