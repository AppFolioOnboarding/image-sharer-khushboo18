require "net/http"

class Article < ApplicationRecord
    validates :link, presence: true
    validate :valid_url, :valid_image_url, :working_url

    def valid_url
        if !link.start_with?("https://") && !link.start_with("http://") 
            errors.clear
            errors.add(:link," is not a valid url")
        end
    end

    def valid_image_url
        if !link.include?(".jpg") && !link.include?(".png") && !link.include?(".jpeg")
            errors.clear
            errors.add(:link," is not a valid image url")
        end
    end

    def working_url
        url = URI.parse(link)
        req = Net::HTTP.new(url.host, url.port)
        req.use_ssl = true if url.scheme == 'https'
        res = req.request_head(url.path)
        if res.code != "200"
            errors.add(:link,"invalid!")
        end
    end
end
