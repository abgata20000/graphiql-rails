class Tag < ApplicationRecord
  has_many :rl_book_tags, dependent: :destroy
  has_many :books, through: :rl_book_tags
end
