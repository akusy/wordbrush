feature "user generator" do
  scenario "generates new user" do
    visit root_path

    expect(page).to have_text "Generate new user"

    click_on "Generate"

    expect(page).to have_text "New user"
    expect(page).to have_text "Click link to redirect to registration."

    expect(page).to have_content "User with code:"

    click_on "User with code:"

    expect(page).to have_text "Registration"
    expect(page).to have_text "Fill the form to complete registration process."
  end
end
