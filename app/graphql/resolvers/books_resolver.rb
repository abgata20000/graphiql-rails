module Resolvers
  class BooksResolver < Resolvers::BaseResolver
    description "books with search and paging"
    type [Types::BookType], null: false
    argument :q, Types::BaseScalar, required: false
    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(query: nil, page: 1, limit: 100)
      search_params = query.present? ? form_ransack_params(query) : {}
      @q = Book.joins(:tags, :authors).ransack(search_params)
      @q.sorts = "id asc" if @q.sorts.blank?
      @q.result(distinct: true).page(page).per(limit)
    end

    # rubocop:disable all
    def form_ransack_params(params)
      param_res = {}
      params.each do |key, val|
        key = key.to_s.underscore
        param_res[key] = if %w[s sorts].include?(key) && val.instance_of?(String)
                           val.split(/\s+/).map(&:underscore).join(" ").strip
                         elsif %w[s sorts].include?(key) && val.instance_of?(Array)
                           val.map { |v| v.split(/\s+/).map(&:underscore).join(" ").strip }
                         elsif %w[g groupings].include?(key) && (val.instance_of?(Hash) || val.instance_of?(Array))
                           if val.instance_of?(Hash)
                             val.values.map { |v| Util.form_ransack_params(v) }
                           else
                             val.map { |v| Util.form_ransack_params(v) }
                           end
                         else
                           val
                         end
      end
      param_res
    end
    # rubocop:enable all
  end
end
