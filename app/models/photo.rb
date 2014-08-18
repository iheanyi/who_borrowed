class Photo
  def initialize(uri)
    @image = download_image
  end

  def original_filename
  end

  private
  def download_image
    open(URI.parse(self.image_url))
  end
end