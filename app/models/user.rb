class User < ActiveRecord::Base

  validates :activation_code, uniqueness: true, presence: true
  validates :question, :answer, presence: true, if: :active?

  QUESTIONS = [
    "Where were you born?",
    "When were you born?",
    "Mother's maiden name?"
  ]

  def active?
    active
  end

end
