class Newsfeed < ApplicationRecord
    validates :news, presence: true, length: {maximum: 255}, uniqueness: true
end
