Fabricator(:donation) do
 user {User.all.sample}
 emergency {Emergency.all.sample}
 amount_donated {Faker::Number.between(500,2000)}
end