describe RegistrationsController do

  describe "#new" do
    let(:user) { create :user }

    before { get :new, activation_code: user.activation_code }

    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:new) }
  end

  describe "#create" do
    let(:user) { create :user, answer: nil, question: nil }

    context "When form was correctly filled" do
      let(:params) do
        {
          activation_code: user.activation_code,
          question: "test question",
          answer: "test answer"
        }
      end

      before do
        post :create, params
        user.reload
      end

      it { is_expected.to redirect_to(new_sessions_path(activation_code: user.activation_code)) }

      it "updates user" do
        expect(user.question).to eq params[:question]
        expect(user.answer).to eq params[:answer]
        expect(user.active).to be_truthy
      end
    end

    context "When form was incorrectly filled" do
      before { post :create, answer: "answer", activation_code: user.activation_code }

      it "redirects back to the registration form" do
        is_expected.to redirect_to(new_registrations_path(
          activation_code: user.activation_code,
          errors: ["Question can't be blank"]
        ))
      end
    end
  end
end
