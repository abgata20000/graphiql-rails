module Types
  class BooksType < Types::BaseObject
    field :pagination, PaginationType, null: true
    field :books, [BookType], null: true
  end
end
