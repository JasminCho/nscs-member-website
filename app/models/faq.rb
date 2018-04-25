class Faq < ApplicationRecord
    validates :question, presence: true, length: {maximum: 255}, uniqueness: true
    validates :answer, presence: true, length: {maximum: 65536}, uniqueness: true
end
