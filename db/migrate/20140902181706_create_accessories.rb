class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :name
      t.text :description
      t.references :resource, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
