module Mutations
  class UpdateBook < BaseMutation
    graphql_name "UpdateBook"

    field :book, Types::BookType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true

    def resolve(**args)
      book = Book.find(args[:id])
      book.update(title: args[:title], description: args[:description])
      {
        book: book,
        result: book.errors.blank?
      }
    end
  end
end
