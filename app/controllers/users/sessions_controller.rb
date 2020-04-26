class Users::SessionsController < Devise::SessionsController

  after_action :custom_login_message, only: [:create]

  private

  def custom_login_message
    flash[:notice] = "Hello, #{current_user.first_name}!"
  end
end
