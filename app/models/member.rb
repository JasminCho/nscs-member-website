class Member < ActiveRecord::Base
    validates_format_of :email, :with => /(\W|^)[\w.+\-]*@gmail\.com(\W|$)/
    validates :email, presence: true, length: {maximum: 255}
    validates :name, presence: true, length: {maximum: 255}
    validates_uniqueness_of :email
    # validates :pace, presence: true
end

