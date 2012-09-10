class AddColumnLbdds < ActiveRecord::Migration
  def up
  	add_column('lbdds','status',:string)
  end

  def down
  	remove_column('lbdds','status')
  end
end
