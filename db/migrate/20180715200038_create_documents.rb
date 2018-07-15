class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.text :file_name
      t.text :client
      t.date :deadline

      t.timestamps
    end
  end
end
