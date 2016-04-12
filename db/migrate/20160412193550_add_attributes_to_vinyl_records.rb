class AddAttributesToVinylRecords < ActiveRecord::Migration
  def change
    add_column :vinyl_records, :artist, :string

    add_column :vinyl_records, :album, :string

    add_column :vinyl_records, :genre, :string

    add_column :vinyl_records, :cost, :decimal
  end
end
