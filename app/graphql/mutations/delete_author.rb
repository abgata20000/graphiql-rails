module Mutations
  class DeleteAuthor < BaseMutation
    graphql_name "DeleteAuthor"
    field :book, Types::BookType, null: true
    field :author, Types::AuthorType, null: true
    field :result, Boolean, null: true

    argument :book_id, ID, required: true
    argument :author, String, required: true

    def resolve(**args)
      book = Book.find(args[:book_id])
      author = Author.find_by(name: args[:author])
      rl = RlBookAuthor.find_by(book: book, author: author)&.destroy
      {
        book: book,
        author: author,
        result: rl.present?
      }
    end
  end
end
