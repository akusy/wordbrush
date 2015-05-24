module UsersHelper

  def user_name
    "Hello #{current_user.username ? current_user.username : "User"}!"
  end
end
