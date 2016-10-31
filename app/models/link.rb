class Link < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, :url => true
  belongs_to :user
end
