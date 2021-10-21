module Mutations
  class CreateBook < BaseMutation
    graphql_name "CreateBook"
    field :book, Types::BookType, null: true
    field :result, Boolean, null: true

    argument :title, String, required: true
    argument :description, String, required: true

    def resolve(**args)
      book = Book.create(title: args[:title], description: args[:description])
      {
        book: book,
        result: book.errors.blank?
      }
    end
  end
end
