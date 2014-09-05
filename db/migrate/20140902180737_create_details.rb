class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :name
      t.text :description
      t.references :detail_type, index: true

      t.timestamps
    end

  end
end
