class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.references :category, index: true
      t.references :state, index: true
      t.references :localization, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
