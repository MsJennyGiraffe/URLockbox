require "rails_helper"

RSpec.feature "user can edit exisiting link" do
  scenario "a registered user can edit their own link" do
    visit "/"
    click_link "Sign Up"
    fill_in :user_email, with: "validuser@email.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Submit"
    fill_in :link_url, with: "http://www.example.com"
    fill_in :link_title, with: "test"
    click_button "Submit Link"

    expect(page).to have_content("http://www.example.com")

    click_link "Edit Link"
    fill_in "link_url", with: "http://www.newexample.com"
    click_button "Edit Link"

    expect(page).to_not have_content("http://www.example.com")
    expect(page).to have_content("http://www.newexample.com")
  end
end
