module Resolvers
  class BookResolver < Resolvers::BaseResolver
    description "book"
    type Types::BookType, null: false
    argument :id, Int, required: false

    def resolve(id:)
      Book.find(id)
    end
  end
end
