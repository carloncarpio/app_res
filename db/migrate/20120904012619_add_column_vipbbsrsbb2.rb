class AddColumnVipbbsrsbb2 < ActiveRecord::Migration
  def up
  	add_column('vipbbsrsbbs','user_id',:integer)
  	add_index('vipbbsrsbbs', 'user_id')
  end

  def down
  	remove_column('vipbbsrsbbs','user_id')
  	remove_index('vipbbsrsbbs', 'user_id')
  end
end
