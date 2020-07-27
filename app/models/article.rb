require 'net/http'

class Article < ApplicationRecord
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
    url = URI.parse(link)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = true if url.scheme == 'https'
    res = req.request_head(url.path)
    return unless res.code != '200'

    errors.clear
    errors.add(:link, ' is not a valid url')
  end
end
