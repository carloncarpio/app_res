class CreateLbdds < ActiveRecord::Migration
  def change
    create_table :lbdds do |t|
      t.string :ticket_num
      t.string :company_name
      t.string :company_contact
      t.integer :flag
      t.string :status
      t.string :section
      t.integer :price
      t.string :approved
      t.string :paid
      t.integer :user_id
      t.string :main_section

      t.timestamps
    end
  end
end
