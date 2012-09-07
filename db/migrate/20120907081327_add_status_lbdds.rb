class AddStatusLbdds < ActiveRecord::Migration
  def up
  	add_column('lbdds','status', :boolean)
  end

  def down
  	remove_column('lbdds','status')
  end
end
