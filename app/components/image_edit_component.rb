# frozen_string_literal: true

class ImageEditComponent < ViewComponent::Base
  def initialize(form:, model:, image_attr:, image_url_attr:)
    @form = form
    @model = model

    if image_attr.is_a?(Symbol) && @model.respond_to?(image_attr)
      @image_attr = image_attr
    else
      raise Exception.new 'Invalid image_attr passed to ImageEditComponent'
    end

    if image_url_attr.is_a?(Symbol) && @model.respond_to?(image_url_attr)
      @image_url_attr = image_url_attr
    else
      raise Exception.new 'Invalid image_url_attr passed to ImageEditComponent'
    end
    
      
  end
end
