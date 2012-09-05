class EditVipbbsrsbb < ActiveRecord::Migration
  def up
  	add_column('vipbbsrsbbs','section', :string)
  end

  def down
  	remove_column('vipbbsrsbbs','section')
  end
end
