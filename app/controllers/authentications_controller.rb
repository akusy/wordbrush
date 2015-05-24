class AuthenticationsController < ApplicationController
  before_action :load_user, except: :destroy
  before_action :load_errors

  private

  def load_user
    unless @user = User.find_by(activation_code: params[:activation_code])
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def load_errors
    @errors = params[:errors]
  end
end
