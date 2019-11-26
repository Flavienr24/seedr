class CreateSeedpacks < ActiveRecord::Migration[5.2]
  def change
    create_table :seedpacks do |t|
      t.string :name
      t.integer :number
      t.text :description
      t.string :image
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
