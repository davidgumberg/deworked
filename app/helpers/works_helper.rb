module WorksHelper
  def work_cover_url(work)
    unless work.is_a? Work
      raise Exception "works_cover_url passed a bad work!"
    end

    if work.cover_image.representable?
      url_for(work.cover_image)
    else
      image_path('unknowncover.svg')
    end
  end
end
