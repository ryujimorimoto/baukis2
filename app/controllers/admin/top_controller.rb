class Admin::TopController < ApplicationController
  def index
    # raise IpAddressRejected
    # raise Forbidden
    render action: :index
  end
end
