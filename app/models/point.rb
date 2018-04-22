class Point < ApplicationRecord
    validates :email, presence: true
    validates :event_name, presence: true
    validates :point, presence: true
end