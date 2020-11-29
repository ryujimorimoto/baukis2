class Admin::SessionsController < Admin::Base
  def new
    if current_admin
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render :new
    end
  end
end
