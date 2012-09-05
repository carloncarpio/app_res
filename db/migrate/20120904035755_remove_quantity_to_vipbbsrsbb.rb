class RemoveQuantityToVipbbsrsbb < ActiveRecord::Migration
  def up
  	remove_column('vipbbsrsbbs','quantity')
  	add_column('vipbbsrsbbs','main_section', :string)
  end

  def down
  	add_column('vipbbsrsbbs','quantity')
  	remove_column('vipbbsrsbbs','main_section')
  end
end
