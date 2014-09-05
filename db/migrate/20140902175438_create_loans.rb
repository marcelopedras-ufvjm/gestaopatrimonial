class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.datetime :start
      t.datetime :end
      t.datetime :devolution_forecast
      t.boolean :booking
      t.text :observation
      t.references :user, index: true
      t.references :resource, index: true

      t.timestamps
    end
  end
end
