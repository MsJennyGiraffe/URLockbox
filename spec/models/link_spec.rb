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

  it "scrapes websites with nokogiri" do
    link = Link.create(
      url: "http://www.example.com",
      title: "internet",
      read: true
    )

    link.scrape("http://www.example.com")

    expect(link.site_name).to eq("Example Domain")
    expect(link.h1).to eq("Example Domain")
  end

  it "scrapes fills in a space when nothing is scraped for a h1" do
    link = Link.create(
      url: "http://www.google.com",
      title: "internet",
      read: true
    )

    link.scrape("http://www.google.com")

    expect(link.h1).to eq(" ")
  end

  it "scrapes fills in a space when nothing is scraped for a title" do
    link = Link.create(
      url: "http://www.bogus.com",
      title: "internet",
      read: true
    )

    link.scrape("http://www.bogus.com")

    expect(link.site_name).to eq(" ")
    expect(link.h1).to eq(" ")
  end
end
