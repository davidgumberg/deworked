module AuthorsHelper
  def author_image_url(author)
    unless author.is_a? Author
      raise Exception "author_image_url passed a bad cover!"
    end

    if author.image.representable?
      url_for author.image.representation(resize_to_limit: [450, 450])
    else
      image_path('unknowndrinker.svg')
    end
  end
end
