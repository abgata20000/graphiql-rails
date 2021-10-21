module Api
  class ApplicationController < ::ApplicationController
    include AllowHeaderControlable

    if ENV["LOCAL_DEV"].blank?
      # rescue_from Exception, with: :render_errors
      # rescue_from ActiveHash::RecordNotFound, with: :render_not_found
      # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      # rescue_from ActionController::RoutingError, with: :render_not_found
    end

    def index
      list_model = instances_class.ransack(q).result(distinct: true)
      list_model = add_paginate(list_model)
      render json: list_model.map(&:show_attributes), status: :ok
    end

    def show
      model = instance_class.find(id)
      render json: model.show_attributes, status: :ok
    end

    def new
      model = create_instance_class.new
      render json: model.show_attributes, status: :ok
    end

    def create
      model = create_instance_class.new
      create_or_update(model)
    end

    def update
      model = update_instance_class.find(id)
      create_or_update(model)
    end

    def destroy
      model = destroy_instance_class.find(id)
      model.destroy
      render json: model.show_attributes, status: :ok
    end

    private

    def render_not_found
      render json: { error: "not found" }, status: 404
    end

    def render_errors(errors, error_code = 500)
      Ab::BugsnagNotifyUtil.bugsnag_notify(errors) if errors
      render json: { errors: errors }, status: error_code
    end

    def action
      action_name.to_sym
    end

    def action?(key)
      action_name.to_sym == key.to_sym
    end

    def instances_class
      raise "継承先で定義すること"
    end

    def instance_class
      instances_class
    end

    def create_instance_class
      instance_class
    end

    def update_instance_class
      create_instance_class
    end

    def destroy_instance_class
      instance_class
    end

    def create_or_update(model)
      model.assign_attributes(controller_params)
      if model.save
        render_create_or_update_ok(model)
      else
        render_create_or_update_error(model)
      end
    end

    def render_create_or_update_ok(model)
      render json: model.show_attributes, status: :ok
    end

    def render_create_or_update_error(model)
      render json: model.show_errors, status: 500
    end

    def controller_params
      raise NotImplementedError, "#{self.class}##{__method__} 継承先で定義すること"
    end

    def id
      params[primary_key]
    end

    def primary_key
      :id
    end

    def page
      params[:page]
    end

    def q
      params[:q].is_a?(String) ? JSON.parse(params[:q]) : params[:q]
    end

    def per_page
      params[:limit] || default_per_page
    end

    def default_per_page
      1000
    end

    # kaminariを使っている場合に呼び出す
    def add_paginate(list_model)
      list_model = list_model.page(page).per(per_page)
      add_paginate_headers(list_model)
      list_model
    end

    # rubocop:disable Metrics/AbcSize:
    def add_paginate_headers(list_model)
      response.headers["Total-Count"] = list_model.total_count
      response.headers["Limit-Value"] = list_model.limit_value
      response.headers["Total-Pages"] = list_model.total_pages
      response.headers["Current-Page"] = list_model.current_page
      response.headers["Next-Page"] = list_model.next_page
      response.headers["Prev-Page"] = list_model.prev_page
      response.headers["First-Page"] = list_model.first_page?
      response.headers["Last-Page"] = list_model.last_page?
      response.headers["Out-Of-Range"] = list_model.out_of_range?
    end
    # rubocop:enable Metrics/AbcSize:
  end
end
