class AddReferenceToSites < ActiveRecord::Migration[5.2]
  def change
    add_reference :sites, :country, foreign_key: true
  end
end
