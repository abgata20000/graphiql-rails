module Mutations
  class CreateTag < BaseMutation
    graphql_name "CreateTag"
    field :book, Types::BookType, null: true
    field :tag, Types::TagType, null: true
    field :result, Boolean, null: true

    argument :book_id, ID, required: true
    argument :tag, String, required: true

    def resolve(**args)
      book = Book.find(args[:book_id])
      tag = Tag.find_or_create_by!(name: args[:tag])
      rl = RlBookTag.find_or_create_by(book: book, tag: tag)
      {
        book: book,
        tag: tag,
        result: rl.errors.blank?
      }
    end
  end
end
