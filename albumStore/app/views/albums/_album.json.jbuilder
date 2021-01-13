json.extract! album, :id, :name, :pic, :description, :price, :sales, :stock, :region_id, :genre_id, :musician_id, :created_at, :updated_at
json.url album_url(album, format: :json)
