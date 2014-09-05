class CreateResourceHistories < ActiveRecord::Migration
  def change
    create_table :resource_histories do |t|
      t.string :name
      t.text :description
      t.datetime :event_time
      t.references :resource, index: true
      t.references :event_type, index: true
      t.references :localization, index: true
      t.references :loan, index: true

      t.timestamps
    end
  end
end
