class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :name
      t.text :description
      t.integer :order
      t.references :resource, index: true
      t.references :detail_type, index: true

      t.timestamps
    end

    add_index :details, [:order, :resource_id ], unique: true
  end
end
