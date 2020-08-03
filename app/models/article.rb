require 'net/http'
require 'httparty'

class Article < ApplicationRecord
  acts_as_taggable_on :tags
  validates :link, presence: true
  validate :valid_url, :valid_image_url, :working_url

  def valid_url
    return unless !link.start_with?('https://') && !link.start_with?('http://')

    errors.clear
    errors.add(:link, ' is not a valid url')
  end

  def valid_image_url
    return unless !link.include?('.jpg') && !link.include?('.png') && !link.include?('.jpeg')

    errors.clear
    errors.add(:link, ' is not a valid image url')
  end

  def working_url
    response = HTTParty.get(link)
    return unless response.code != 200

    errors.clear
    errors.add(:link, ' is not a valid url')
  end
end
