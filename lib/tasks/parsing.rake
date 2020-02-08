require 'csv'
namespace :parsing do
  desc "Pull country data into the database"
  task seed_everything: :environment do

    #drop the old table data before importing the new stuff
    Country.destroy_all

    CSV.foreach("lib/assets/whc-sites-2019.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      # only create country entry if it does not exist already
      if !Country.exists?(states_name: row[30])
        #create new model instances with the data
        Country.create!(
          states_name: row[30],
          region: row[32],
        )
      end
    end
    
    #drop the old table data before importing the new stuff
    Site.destroy_all

    CSV.foreach("lib/assets/whc-sites-2019.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read
      
      country = Country.where(["states_name = ?", row[30]]).first
      #create new model instances with the data
      Site.create!(
      name_en: row[3],
      short_description_en: row[5],
      date_inscribed: row[9],
      longitude: row[14].to_d,
      latitude: row[15].to_d,
      country_id: country.id
      )
    end
  end

end