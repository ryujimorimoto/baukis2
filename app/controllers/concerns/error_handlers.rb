module ErrorHandlers
  extend ActiveSupport::Concern
  included do
    # rescue_fromは親子関係を指定する場合、先祖の方を先に指定しなければならない。
    rescue_from StandardError, with: :rescue500
    # ForbiddenとIpAddressRejectedは、StandardErrorの子孫クラスなので、後に記載しなければならない。
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  private def rescue403(e)
    @exception = e
    render template: "errors/forbidden", status: 403
  end
  private def rescue404
    render "errors/not_found", status: 404
  end
  private def rescue500(e)
    render template: "errors/internal_server_error", status: 500
  end

  module ClassMethods
    # static methods
    # def static_method
    #
    # end
  end
end
