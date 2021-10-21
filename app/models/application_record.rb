class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  extend Enumerize
  extend ActiveHash::Associations::ActiveRecordExtensions

  def show_attributes
    attributes.each_with_object({}) do |(key, value), hash|
      next if ignore_show_attribute_keys.include?(key)

      hash[key] = if value.present? && value.is_a?(ActiveSupport::TimeWithZone)
                    I18n.l(value)
                  else
                    value
                  end
    end.merge(add_show_attributes_params)
  end

  def show_errors
    { messages: errors.to_hash(true), full_messages: errors.full_messages }
  end

  private

  def ignore_show_attribute_keys
    []
  end

  def add_show_attributes_params
    {}
  end
end
