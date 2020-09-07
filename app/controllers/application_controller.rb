class ApplicationController < ActionController::Base
  layout :set_layout

  private
  def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
  def rescue403(e)
    @exception = e
    render template: "errors/forbidden", status: 403
  end
end
