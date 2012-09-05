class AddPaidToVipbbsrsbb < ActiveRecord::Migration
  def up
  	add_column('vipbbsrsbbs','paid',:string)
  end

  def down
  	remove_column('vipbbsrsbbs','paid')
  end
end
