module Resolvers
  class BooksResolver < Resolvers::BaseResolver
    description "books with search and paging"
    type Types::BooksType, null: true
    argument :q, Types::BaseScalar, required: false
    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(query: nil, page: 1, limit: 100)
      search_params = query.present? ? form_ransack_params(query) : {}
      @q = Book.joins(:tags, :authors).ransack(search_params)
      @q.sorts = "id asc" if @q.sorts.blank?
      books = @q.result(distinct: true).page(page).per(limit)
      {
        books: books,
        pagination: pagination(books)
      }
    end
  end
end
