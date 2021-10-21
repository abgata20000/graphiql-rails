module Api
  class OptionsRequestController < ::Api::ApplicationController
    ACCESS_CONTROL_ALLOW_METHODS = %w[GET OPTIONS PUT DELETE POST].freeze
    ACCESS_CONTROL_ALLOW_HEADERS = %w[Accept Origin Content-Type Authorization Token].freeze
    ACCESS_CONTROL_MAX_AGE = 86_400
    skip_before_action :verify_authenticity_token

    def preflight
      response.headers["Access-Control-Max-Age"] = ACCESS_CONTROL_MAX_AGE
      response.headers["Access-Control-Allow-Headers"] = ACCESS_CONTROL_ALLOW_HEADERS.join(",")
      response.headers["Access-Control-Allow-Methods"] = ACCESS_CONTROL_ALLOW_METHODS.join(",")
      response.headers["Access-Control-Allow-Origin"] = "*"
      head :ok
    end
  end
end
