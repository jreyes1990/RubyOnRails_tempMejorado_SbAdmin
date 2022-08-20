class CreateMenuRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_roles do |t|
      t.integer :menu_padre
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :rol, null: false, foreign_key: true
      t.references :opcion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
