Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post '/graphql', to: 'graphql#execute'
  root to: 'static_pages#top'
  # API
  namespace :api do
    match '*path' => 'options_request#preflight', via: :options
    namespace :v1 do
      resource :sample, only: :show
    end
  end
end
