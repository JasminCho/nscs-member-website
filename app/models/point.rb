class Point < ApplicationRecord
    validates_format_of :email, :with => /(\W|^)[\w.+\-]*@gmail\.com(\W|$)/, presence: true
    validates :event_name, presence: true
    validates :point, presence: true
end