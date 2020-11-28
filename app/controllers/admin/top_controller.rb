class Admin::TopController < Admin::Base
  def index
    # raise IpAddressRejected
    # raise Forbidden
    render action: :index
  end
end
