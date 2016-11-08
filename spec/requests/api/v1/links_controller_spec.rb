require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :request do
  describe "GET#index" do
    it 'returns all links' do
      user = User.create(email: "test@test.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link_one = Link.create(url: "http://www.test.com", title: "one", user_id: user.id)
      link_two = Link.create(url: "http://www.test2.com", title: "two", user_id: user.id)
      link_three = Link.create(url: "http://www.test3.com", title: "five", user_id: user.id)

      get "/api/v1/links"
      links = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(3).to eq(links.count)
    end

    it 'returns all read links' do
      user = User.create(email: "test@test.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link_one = Link.create(url: "http://www.test.com", title: "one", user_id: user.id)
      link_two = Link.create(url: "http://www.test2.com", title: "two", user_id: user.id, read: true)
      link_three = Link.create(url: "http://www.test3.com", title: "five", user_id: user.id)

      get "/api/v1/links", { :sortType => 'read' }
      link = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(1).to eq(link.count)
    end

    it 'returns all unread links' do
      user = User.create(email: "test@test.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link_one = Link.create(url: "http://www.test.com", title: "one", user_id: user.id)
      link_two = Link.create(url: "http://www.test2.com", title: "two", user_id: user.id, read: true)
      link_three = Link.create(url: "http://www.test3.com", title: "five", user_id: user.id)

      get "/api/v1/links", { :sortType => 'unread' }
      link = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(2).to eq(link.count)
    end

    it 'returns all links if params are not accounted for' do
      user = User.create(email: "test@test.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link_one = Link.create(url: "http://www.test.com", title: "one", user_id: user.id)
      link_two = Link.create(url: "http://www.test2.com", title: "two", user_id: user.id, read: true)
      link_three = Link.create(url: "http://www.test3.com", title: "five", user_id: user.id)

      get "/api/v1/links", { :sortType => 'gimme!' }
      link = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(3).to eq(link.count)
    end
  end
end
