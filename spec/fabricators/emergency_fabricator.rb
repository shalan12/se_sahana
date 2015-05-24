Fabricator(:emergency) do
 lat {Faker::Address.latitude}
 long {Faker::Address.longitude}
 emergency_type {Faker::Lorem.word}
 amount_needed {Faker::Number.between(5000,20000)}
 start_time {Faker::Date.backward}
 end_time {Faker::Date.forward}
end