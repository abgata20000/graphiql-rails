module Mutations
  class CreateAuthor < BaseMutation
    graphql_name "CreateAuthor"
    field :book, Types::BookType, null: true
    field :author, Types::AuthorType, null: true
    field :result, Boolean, null: true

    argument :book_id, ID, required: true
    argument :author, String, required: true
    argument :description, String, required: false

    def resolve(**args)
      book = Book.find(args[:book_id])
      author = Author.find_or_create_by!(name: args[:author]) do |tmp_author|
        tmp_author.description = args[:description] if args[:description].present?
      end
      rl = RlBookAuthor.find_or_create_by(book: book, author: author)
      {
        book: book,
        author: author,
        result: rl.errors.blank?
      }
    end
  end
end
