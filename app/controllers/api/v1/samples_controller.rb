module Api
  module V1
    class SamplesController < ::Api::V1::ApplicationController
      def show
        render json: { result: true, page: "sample" }
      end
    end
  end
end
