class Member < ActiveRecord::Base
    validates_format_of :email, :with => /(\W|^)[\w.+\-]*@gmail\.com(\W|$)/, presence: true
    validates :name, presence: true
    validates_uniqueness_of :email
    # validates :pace, presence: true
end

