require 'rails_helper'

describe Link do
  context "update_read" do
    it "updates the read attribute in database to true" do
      link = Link.create(
        url: "http://www.internet.com",
        title: "internet"
      )
      read_params = "read"

      expect(link.read).to eq(false)

      link.update_read(read_params)

      expect(link.read).to eq(true)
    end
  end

  it "updates the read attribute in database to false" do
    link = Link.create(
      url: "http://www.internet.com",
      title: "internet",
      read: true
    )
    read_params = "unread"

    expect(link.read).to eq(true)

    link.update_read(read_params)

    expect(link.read).to eq(false)
  end
end
