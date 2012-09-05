class AddColumnVipbbsrsbb < ActiveRecord::Migration
  def up
  	add_column('vipbbsrsbbs','price',:string)
  	add_column('vipbbsrsbbs','approved',:string)
  end

  def down
  	remove_column('vipbbsrsbbs','price')
  	remove_column('vipbbsrsbbs','approved')
  end
end
