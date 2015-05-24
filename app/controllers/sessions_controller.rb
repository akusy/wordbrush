class SessionsController < AuthenticationsController

  def new
    unless @user.active?
      redirect_to(new_registrations_path, activation_code: params[:activation_code])
    end
  end

  def create
    if @user.answer == params[:answer]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to(new_sessions_path(
        activation_code: params[:activation_code],
        errors: "Wrong answer. Try again."
      ))
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to new_user_path
  end

end
