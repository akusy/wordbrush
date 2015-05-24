class User < ActiveRecord::Base

  before_create :set_activation_code

  validates :activation_code, uniqueness: true, presence: true

  def active?
    active
  end

  private
  def set_activation_code
    self.activation_code = SecureRandom.hex
  end
end
