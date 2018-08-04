class AddReminderDateToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :reminder_date, :date
  end
end
