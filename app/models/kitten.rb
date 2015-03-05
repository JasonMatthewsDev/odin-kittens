class Kitten < ActiveRecord::Base
    validates :name,     presence: true
    validates :age,      presence: true, numericality: true
    validates :cuteness, presence: true, numericality: true
    validates :softness, presence: true, numericality: true
    
end
