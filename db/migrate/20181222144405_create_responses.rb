class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :response
      t.references :question, index: true
      t.timestamps
    end
  end
end
