class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.references :survey, index: true
      t.timestamps
    end
  end
end
