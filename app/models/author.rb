class Author < ApplicationRecord
  has_many :rl_book_authors, dependent: :destroy
  has_many :books, through: :rl_book_authors

  enumerize :status, in: { disabled: 0, enabled: 1 }, scope: true, default: :enabled

  default_value_for :description, ""
end
