require 'rails_helper'

RSpec.feature "view links" do
  scenario "a registered user can add links" do
    visit "/"
    click_link "Sign Up"
    fill_in :user_email, with: "validuser@email.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Submit"

    expect(current_path).to eq(links_path)

    fill_in :link_url, with: "http://www.validurl.com"
    fill_in :link_title, with: "super cool url"

    within(".urls") do
      expect(page).to_not have_content("super cool url")
    end

    click_button("Submit Link")

    within(".urls") do
      expect(page).to have_content("super cool url")
    end
  end

  scenario "a registered user can only add links with valid urls" do
    visit "/"
    click_link "Sign Up"
    fill_in :user_email, with: "validuser@email.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Submit"

    expect(current_path).to eq(links_path)

    fill_in :link_url, with: "www.validurl.com"
    fill_in :link_title, with: "not super cool url"
    click_button("Submit Link")
    
    expect(page).to have_content("Url is not a valid URL")
    within(".urls") do
      expect(page).to_not have_content("not super cool url")
    end
  end
end
