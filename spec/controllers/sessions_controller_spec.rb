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

    context "When activation_code is incorrect" do
      before { get :new, activation_code: "incorrect_code" }

      it { is_expected.to respond_with(:not_found) }
    end
  end

  describe "#create" do
    let(:user) { create :user, active: true }

    context "When user answered the question" do
      before { post :create, answer: user.answer, activation_code: user.activation_code }

      it "saves user ID to session" do
        expect(session[:user_id]).to eq user.id
      end

      it { is_expected.to redirect_to users_path }
    end

    context "When user did not answer the question" do
      before { post :create, answer: "?", activation_code: user.activation_code }

      it "redirects back to the login form" do
        is_expected.to redirect_to(new_sessions_path(
          activation_code: user.activation_code,
          errors: "Wrong answer. Try again."
        ))
      end
    end
  end

  describe "#destroy" do
    let(:user) { create :user }

    before do
      session[:user_id] = user.id
      delete :destroy
    end

    it { is_expected.to redirect_to new_user_path }

    it "clears session" do
      expect(session[:user_id]).to be_nil
    end
  end
end
