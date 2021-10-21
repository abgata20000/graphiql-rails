module Mutations
  class DeleteTag < BaseMutation
    graphql_name "DeleteTag"
    field :book, Types::BookType, null: true
    field :tag, Types::TagType, null: true
    field :result, Boolean, null: true

    argument :book_id, ID, required: true
    argument :tag, String, required: true

    def resolve(**args)
      book = Book.find(args[:book_id])
      tag = Tag.find_by(name: args[:tag])
      rl = RlBookTag.find_by(book: book, tag: tag)&.destroy
      {
        book: book,
        tag: tag,
        result: rl.present?
      }
    end
  end
end
