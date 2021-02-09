class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :body
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
