module AllowHeaderControlable
  extend ActiveSupport::Concern
  ACCESS_CONTROL_EXPOSE_HEADERS = %w[content-type cache-control Total-Count Limit-Value Total-Pages Current-Pag Next-Page Prev-Page First-Page Last-Page Out-Of-Range].freeze

  included do
    before_action :allow_access_origin
  end

  private

  def allow_access_origin
    response.headers["Access-Control-Allow-Headers"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
    response.headers["Access-Control-Expose-Headers"] = ACCESS_CONTROL_EXPOSE_HEADERS.join(",")
    response.headers["Access-Control-Allow-Origin"] = allow_host
  end

  def allow_host
    "*"
  end
end
