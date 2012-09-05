class AddColumnLbdd < ActiveRecord::Migration
  def up
  	add_column('lbdds','company_email',:string)
  	add_index('lbdds','user_id')
  end

  def down
  	remove_column('lbdds','company_email')
  	remove_index('lbdds','user_id')
  end
end
