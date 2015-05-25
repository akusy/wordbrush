describe SessionsController do

  describe "#new" do
    context "When user is registered" do
      let(:user) { create :user, active: true }

      before { get :new, activation_code: user.activation_code }

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:new) }
    end

    context "When user is not registered" do
      let(:user) { create :user }

      before { get :new, activation_code: user.activation_code }

      it { is_expected.to redirect_to(new_registrations_path(activation_code: user.activation_code)) }
    end
  end
end
