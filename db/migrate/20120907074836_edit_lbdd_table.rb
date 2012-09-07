class EditLbddTable < ActiveRecord::Migration
  def up
  	remove_column('lbdds','status')
  end

  def down
  	add_column('lbdds','status', :string)
  end
end
