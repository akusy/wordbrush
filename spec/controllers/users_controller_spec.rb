describe UsersController do

  describe "#new" do
    before { get :new }

    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:new) }
  end

  describe "#index" do
    before { get :index }

    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:index) }
  end

  describe "#create" do
    before do
      expect(User).to receive(:create)

      post :create
    end

    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:create) }
  end
end
