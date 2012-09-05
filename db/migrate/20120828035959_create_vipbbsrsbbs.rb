class CreateVipbbsrsbbs < ActiveRecord::Migration
  def change
    create_table :vipbbsrsbbs do |t|
      t.string :ticket_num
      t.integer :quantity
      t.string :company_name
      t.string :company_contact
      t.string :company_email
      t.integer :flag
      t.integer :approved

      t.timestamps
    end
  end
  def self.down
    drop_table :vipbbsrsbbs
  end
end
