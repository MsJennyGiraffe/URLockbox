require "rails_helper"

RSpec.feature "user can sort links by title", :js => true do
  scenario "a registered user can sort their links" do
    user = User.create(email: "test@test.com", password: "password")
    link_one = Link.create(url: "http://www.test.com", title: "one", user_id: user.id)
    link_two = Link.create(url: "http://www.test2.com", title: "two", user_id: user.id)
    link_three = Link.create(url: "http://www.test3.com", title: "five", user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path(user)
    click_link_or_button("Alpha Sort")
  end
end
