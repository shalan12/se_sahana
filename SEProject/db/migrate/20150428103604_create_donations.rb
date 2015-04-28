class CreateDonations < ActiveRecord::Migration
  def up
   create_table :donations do |d|
   	d.references 'emergency'
   	d.references 'user'
   	d.float 'amount_donated'
   end
  end

  def down
  	drop_table 'donations'
  end
end
