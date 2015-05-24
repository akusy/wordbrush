class SessionsController < AuthenticationsController

  def new
    unless @user.active?
      redirect_to(new_registrations_path, activation_code: params[:activation_code])
    end
  end

end
