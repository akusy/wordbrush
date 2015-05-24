class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(activation_code: SecureRandom.hex)
  end

  def index
  end
end
