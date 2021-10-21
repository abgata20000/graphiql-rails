module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::CreateBook
    field :update_book, mutation: Mutations::UpdateBook
    field :delete_book, mutation: Mutations::DeleteBook
    field :create_tag, mutation: Mutations::CreateTag
    field :delete_tag, mutation: Mutations::DeleteTag
    field :create_author, mutation: Mutations::CreateAuthor
    field :delete_author, mutation: Mutations::DeleteAuthor
  end
end
