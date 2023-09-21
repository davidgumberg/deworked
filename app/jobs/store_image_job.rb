require 'open-uri'

class StoreImageJob < ApplicationJob
  queue_as :default

  PERMITTED_IMAGE_FORMATS = %w[png PNG jpg JPG jpeg JPEG webp WEBP svg SVG].freeze

  def perform(image_attribute, url)
    image_format = get_content_type(url)
    return unless image_format

    uri = URI.parse(url)
    image_file = uri.open
    image_name = sanitize_filename(File.basename(url))
    image_attribute.attach(io: image_file, filename: image_name,
                           content_type: image_format)
  end

  private

  def get_content_type(url)
    ext = File.extname(url).delete('.')

    unless PERMITTED_IMAGE_FORMATS.include?(ext)
      return nil
    else
      "image/#{ext}"
    end
       
  end

  # From ancient attachment_fu gem
  def sanitize_filename(filename)
    filename.strip.tap do |name|
      # Filter leading directory /'s and \'s
      name.sub! (/\A.*(\\|\/)/), ''
      # Anything that isn't alphanumeric, 
      name.gsub! (/[^A-Za-z0-9\.\_]/), '_'
    end
  end
end
