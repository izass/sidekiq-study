class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :to
      t.string :content
      t.boolean :sent, default:false

      t.timestamps
    end
  end
end
