class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name_en
      t.string :short_description_en
      t.string :date_inscribed
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
