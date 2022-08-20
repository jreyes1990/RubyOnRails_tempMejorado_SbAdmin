class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :nombre, limit: 200
      t.text :descripcion
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
