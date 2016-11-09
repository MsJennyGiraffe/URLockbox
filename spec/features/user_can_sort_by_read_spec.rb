require "rails_helper"

RSpec.feature "user can sort links by read", :js => true do
  scenario "a registered user can sort their links" do
    user = User.create(email: "test@test.com", password: "password")
    link_one = Link.create(url: "http://www.test.com", title: "one", user_id: user.id)
    link_two = Link.create(url: "http://www.test2.com", title: "two", user_id: user.id, read: true)
    link_three = Link.create(url: "http://www.test3.com", title: "five", user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path(user)
    click_button("Show Read")

    expect(page).to_not have_content(link_one.title)
    expect(page).to have_content(link_two.title)
    expect(page).to_not have_content(link_three.title)
  end

  scenario "a registered user can sort their links" do
    user = User.create(email: "test@test.com", password: "password")
    link_one = Link.create(url: "http://www.test.com", title: "one", user_id: user.id)
    link_two = Link.create(url: "http://www.test2.com", title: "two", user_id: user.id, read: true)
    link_three = Link.create(url: "http://www.test3.com", title: "five", user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path(user)
    click_button("Show Unread")

    expect(page).to have_content(link_one.title)
    expect(page).to_not have_content(link_two.title)
    expect(page).to have_content(link_three.title)  
  end
end
