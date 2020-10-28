class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end
  include ErrorHandlers if Rails.env.production?

  private
  def set_layout
    # NOTE:  params[:controller]から、controller_pathに変更。専用メソッドを使って切り分けるべきであり、paramsは使わない方が良いと考える。
    if controller_path.match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end

end
