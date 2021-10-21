module Api
  module V1
    class ApplicationController < ::Api::ApplicationController
      protect_from_forgery with: :null_session
      skip_before_action :verify_authenticity_token
    end
  end
end