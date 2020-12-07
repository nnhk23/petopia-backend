class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.string :age
      t.string :kid_friendly
      t.string :personality
      t.string :img_url
      t.string :description
      t.string :url
      t.string :email

      t.timestamps
    end
  end
end
