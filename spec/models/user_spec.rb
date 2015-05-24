describe User do
  it { is_expected.to validate_uniqueness_of(:activation_code) }

  it { is_expected.to validate_presence_of(:activation_code) }
end
