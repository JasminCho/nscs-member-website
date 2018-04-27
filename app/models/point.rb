class Point < ApplicationRecord
    validates_format_of :email, :with => /(\W|^)[\w.+\-]*@gmail\.com(\W|$)/, presence: true, length: {maximum: 255}
    validates :event_name, presence: true, length: {maximum: 255}
    validates :point, presence: true
end