class CreateDetailsResources < ActiveRecord::Migration
  def change
    create_table :details_resources, id: false do |t|
      t.belongs_to :resource, index: true
      t.belongs_to :detail, index: true
    end
  end
end
