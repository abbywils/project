json.extract! site, :id, :name_en, :short_description_en, :date_inscribed, :longitude, :latitude, :created_at, :updated_at
json.url site_url(site, format: :json)
