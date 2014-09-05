class CreateAccessoriesResources < ActiveRecord::Migration
  def change
    create_table :accessories_resources, id: false do |t|
      t.belongs_to :resource, index: true
      t.belongs_to :accessory, index: true
    end
  end
end
