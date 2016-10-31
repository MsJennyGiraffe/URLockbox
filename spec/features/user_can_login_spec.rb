require "rails_helper"

RSpec.feature "user login" do
  scenario "a registered user can login and logout" do
    visit "/"
    click_link "Sign Up"
    fill_in :user_email, with: "validuser@email.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Hello, validuser@email.com")
    expect(page).to_not have_content("Sign Up")

    click_link("Logout")

    expect(page).to_not have_content("Hello, validuser@email.com")

    click_link("Login")

    fill_in :session_email, with: "validuser@email.com"
    fill_in :session_password, with: "password"
    click_button "Submit"
    expect(page).to have_content("Hello, validuser@email.com")
  end

  scenario "an unregistered user cannot log in" do
    visit "/"
    click_link "Login"
    fill_in :session_email, with: "invaliduser@email.com"
    fill_in :session_password, with: "password"
    click_button "Submit"

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content("Hello, invaliduser@email.com")
    expect(page).to have_content("Username/Password Invalid")
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Login")
  end
end
