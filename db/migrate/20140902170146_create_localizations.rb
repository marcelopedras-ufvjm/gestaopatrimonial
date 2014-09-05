class CreateLocalizations < ActiveRecord::Migration
  def change
    create_table :localizations do |t|
      t.string :name
      t.text :description
      t.string :complement
      t.references :building, index: true

      t.timestamps
    end
  end
end
