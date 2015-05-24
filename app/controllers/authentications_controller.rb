class AuthenticationsController < ApplicationController
  before_action :load_user, except: :destroy

  private

  def load_user
    unless @user = User.find_by(activation_code: params[:activation_code])
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end
end
