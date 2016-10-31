class Link < ApplicationRecord
  validates :name, presence: true
  validates :url, url: true, presence: true
end
