class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.references :artist, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.string :image
      t.string :mediums, null: false

      t.timestamps
    end
  end
end
