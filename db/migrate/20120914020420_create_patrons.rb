class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :ticket_num
      t.string :company_name
      t.string :company_contact
      t.string :company_email
      t.integer :flag
      t.boolean :status
      t.string :section
      t.string :price
      t.string :approved
      t.string :paid
      t.integer :user_id
      t.string :main_section

      t.timestamps
    end
  end

  def self.down
    drop_table :patrons
  end
end
