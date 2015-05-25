feature "registration and authentication" do

  feature "new user registration and login" do
    given(:user) { create(:user, :newcomer) }

    scenario "redirects to registration and login" do
      visit "/sessions/#{ user.activation_code }"

      expect(page).to have_text "Registration"
      expect(page).to have_text "Fill the form to complete registration process."

      fill_in 'username', with: 'John Doe'
      select 'Where were you born?', from: '[question]'
      fill_in 'answer', with: 'Warsaw'

      click_on "Save"

      expect(page).to have_text "Sign in"
      expect(page).to have_text "Where were you born?"

      fill_in 'answer', with: 'Warsaw'

      click_on "Send"

      expect(page).to have_text "Hello John Doe!"
      expect(page).to have_text "You are logged in!"

      visit root_path

      expect(page).to have_text "Hello John Doe!"
      expect(page).to have_content "Logout"
    end
  end

  feature "active user login" do
    given(:user) { create(:user, active: true, username: "Johny") }

    scenario "renders login" do
      visit "/sessions/#{ user.activation_code }"

      expect(page).to have_text "Sign in"
      expect(page).to have_text "Where were you born?"

      fill_in 'answer', with: 'London'

      click_on "Send"

      expect(page).to have_text "Hello Johny!"
      expect(page).to have_text "You are logged in!"

      visit root_path

      expect(page).to have_text "Hello Johny!"
      expect(page).to have_content "Logout"
    end
  end
end
