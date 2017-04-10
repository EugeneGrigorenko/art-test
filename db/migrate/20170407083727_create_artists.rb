class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.date :date_of_birth
      t.text :biography

      t.timestamps
    end
  end
end
