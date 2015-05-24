class FixColumnNames < ActiveRecord::Migration
  def up
  	rename_column :users, :type, :user_type
  	rename_column :emergencies, :type, :emergency_type
  end

  def down
  end
end
