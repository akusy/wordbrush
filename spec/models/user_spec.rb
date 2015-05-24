describe User do
  it { is_expected.to validate_uniqueness_of(:activation_code) }

  it { is_expected.to validate_presence_of(:activation_code) }

  context "When user is active" do
    before { expect_any_instance_of(User).to receive(:active?).and_return true }

    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_presence_of(:answer) }
  end

  context "When user is not active" do
    it { is_expected.not_to validate_presence_of(:question) }
    it { is_expected.not_to validate_presence_of(:answer) }
  end

  describe "#active?" do
    context "When user is active" do
      let(:user) { build :user, active: true }

      it "returns true" do
        expect(user.active?).to be_truthy
      end
    end

    context "When user is not active" do
      let(:user) { build :user, active: false }

      it "returns false" do
        expect(user.active?).to be_falsey
      end
    end
  end
end
