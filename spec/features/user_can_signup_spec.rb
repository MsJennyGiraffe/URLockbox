# As an unauthenticated user, if I click "Sign Up", I should be taken to a user
# form where I can enter an email address, a password, and a password confirmation.
#
# I cannot sign up with an email address that has already been used.
# Password and confirmation must match.
# If criteria is not met the user should be given a message to reflect the reason they could not sign up.
# Upon submitting this information, I should be logged in via a session cookie and redirected to the "Links Index" page.

require "rails_helper"

RSpec.feature "user can signup" do
  scenario "an unregistered user can sign up" do
    visit "/"
    click_link "Sign Up"
    fill_in :email, with: "validuser@email.com"
    fill_in :password, with: "password"
    click_button "Submit"

    expect(current_link).to eq("/links")
    expect(page).to have_content("Hello, validuser@email.com")
    expect(page).to_not have_content("Sign Up")
  end
end
