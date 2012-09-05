class EditVipbbsrsbbs < ActiveRecord::Migration
  def up
  	remove_column('vipbbsrsbbs', 'approved')
  	add_column('vipbbsrsbbs', 'status', :boolean, :default => false)
  end

  def down
  	add_column('vipbbsrsbbs', 'approved', :string)
  	remove_column('vipbbsrsbbs', 'status')
  end
end
