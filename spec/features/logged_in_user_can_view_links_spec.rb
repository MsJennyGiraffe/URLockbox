require "rails_helper"

RSpec.feature "view links" do
  scenario "a registered user can view links" do
    visit "/"
    click_link "Sign Up"
    fill_in :user_email, with: "validuser@email.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to_not have_content("Sign in to View Links")
    expect(page).to have_content("Url")
    expect(page).to have_content("Title")
  end

  scenario "a nonlogged in user cannot view links" do
    visit "/links"

    expect(page).to have_content("Log in to URLockBox")
    expect(page).to_not have_content("Url")
    expect(page).to_not have_content("Title")
  end
end
