Fabricator(:user) do
 username {Faker::Internet.user_name}
 password {Faker::Internet.password}
 user_type {["donor","field-worker","NGO-worker"].sample}
end