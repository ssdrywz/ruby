class Favorite < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :album, class_name: "Album"
  validates :user_id, presence: true
  validates :album_id, presence: true
end