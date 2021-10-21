module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    argument_class Types::BaseArgument

    private

    # kaminariのメソッドを使って件数を返す
    def pagination(result)
      {
        total_count: result.total_count,
        limit_value: result.limit_value,
        total_pages: result.total_pages,
        current_page: result.current_page
      }
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
