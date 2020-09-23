class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  # rescue_fromは親子関係を指定する場合、先祖の方を先に指定しなければならない。
  rescue_from StandardError, with: :rescue500
  # ForbiddenとIpAddressRejectedは、StandardErrorの子孫クラスなので、後に記載しなければならない。
  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403

  private
  def set_layout
    # NOTE:  params[:controller]から、controller_pathに変更。専用メソッドを使って切り分けるべきであり、paramsは使わない方が良いと考える。
    if controller_path.match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
  def rescue403(e)
    @exception = e
    render template: "errors/forbidden", status: 403
  end
  def rescue500(e)
    render template: "errors/internal_server_error", status: 500
  end
end
