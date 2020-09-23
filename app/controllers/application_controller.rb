class ApplicationController < ActionController::Base
  layout :set_layout

rescue_from StandardError, with: :rescue500

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
