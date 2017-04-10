module Api
  class ArtworkResource < JSONAPI::Resource
    attributes :artist_id, :title, :year, :mediums, :image_url, :large_image_url, :published

    has_one :artist

    def image_url
      @model.image_url(:preview)
    end

    def large_image_url
      @model.image_url(:large)
    end
  end
end
