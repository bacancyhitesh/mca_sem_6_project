class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.references :industry_type, foreign_key: true

      t.timestamps
    end
  end
end
