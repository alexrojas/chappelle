class Joke < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 15}, uniqueness: {case_sensitive: false} 
end
