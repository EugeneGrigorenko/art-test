module Api
  class ArtistResource < JSONAPI::Resource
    attributes :name, :date_of_birth, :biography, :artworks_count

    has_many :artworks
    def artworks_count
      @model.artworks.count
    end
  end
end
