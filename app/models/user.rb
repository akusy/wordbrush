class User < ActiveRecord::Base

  before_create :set_activation_code

  def active?
    active
  end

  private
  def set_activation_code
    self.activation_code = SecureRandom.hex
  end
end
