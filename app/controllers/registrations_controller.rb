class RegistrationsController < AuthenticationsController
  def new
  end

  def create
    if @user.update_attributes(user_registration_params.merge(active: true))
      redirect_to(new_sessions_path(activation_code: params[:activation_code]))
    else
      redirect_to(new_registrations_path(
        activation_code: params[:activation_code],
        errors: @user.errors.full_messages
      ))
    end
  end

  private

  def user_registration_params
    params.permit(:username, :question, :answer)
  end

end
