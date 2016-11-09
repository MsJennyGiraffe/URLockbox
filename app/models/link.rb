class Link < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, :url => true
  belongs_to :user

  def update_read(read_params)
    if read_params == "read"
      self.read = true
    else
      self.read = false
    end
  end

  def scrape(url)
    doc = Nokogiri::HTML(open(url))
    if doc.at_css("title").nil?
      self.site_name = " "
    else
      self.site_name = doc.at_css("title").text
    end

    if doc.at_css("h1").nil?
      self.h1 = " "
    else
      self.h1 = doc.at_css("h1").text
    end
  end
end
