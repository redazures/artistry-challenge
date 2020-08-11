class Artist < ApplicationRecord
    has_many :plays
    has_many :instruments, through: :plays
    validates :name, presence: true
    validates :title, uniqueness: true 
end
