require "rails_helper"

RSpec.feature "user can signup" do
  scenario "an unregistered user can sign up" do
    visit "/"
    click_link "Sign Up"
    fill_in :user_email, with: "validuser@email.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Hello, validuser@email.com")
    expect(page).to_not have_content("Sign Up")
  end
end
