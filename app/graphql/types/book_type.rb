module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :released_at, GraphQL::Types::ISO8601DateTime, null: true
    field :price, Integer, null: false
    field :status, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :tags, [Types::TagType], null: false
    field :authors, [Types::AuthorType], null: false
  end
end
