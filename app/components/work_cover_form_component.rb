# frozen_string_literal: true

class WorkCoverFormComponent < ViewComponent::Base
  def initialize(work:, form:)
    @work = work
    @form = form
  end

  def before_render()
    @work_cover_url = if @work.cover_image.present?
                        url_for(@work.cover_image)
                      else
                        image_path('unknowncover.svg')
                      end
  end
end
