class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :company_name
      t.string :company_contact
      t.string :company_email
      t.integer :flag, :default => '0'

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
