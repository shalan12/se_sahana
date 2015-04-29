class CreateEmergencies < ActiveRecord::Migration
  def up
  	create_table :emergencies do |e|
  		e.float 'amount_needed'
  		e.string 'emergency_type'
  		e.float 'lat'
  		e.float 'long'
  		e.datetime 'start_time'
  		e.datetime 'end_time'
  	end
  end

  def down
  	drop_table 'emergencies'
  end
end
