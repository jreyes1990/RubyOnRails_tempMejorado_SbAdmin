class CreateOpcionCas < ActiveRecord::Migration[6.0]
  def change
    create_table :opcion_cas do |t|
      t.text :descripcion
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :componente, null: false, foreign_key: true
      t.references :atributo, null: false, foreign_key: true
      t.references :opcion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
