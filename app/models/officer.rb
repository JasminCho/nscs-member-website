class Officer < ApplicationRecord
    validates :email, presence: true, length: {maximum: 255}, uniqueness: true
    validates :name, presence: true, length: {maximum: 255}
    validates :position, presence: true, length: {maximum: 255}, uniqueness: true
    validates :major, presence: true, length: {maximum: 255}
    validates :year, presence: true, length: {maximum: 255}
end
