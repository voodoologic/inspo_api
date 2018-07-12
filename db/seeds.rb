# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
state_districts = YAML.load_file('db/states_districts.yml')
people = YAML.load_file('db/people.yml')
State.destroy_all
District.destroy_all
Person.destroy_all
Role.destroy_all
Role.create(role_type: 'candidate')
Role.create(role_type: 'voter')

state_districts.each do |state|
  name = state.keys.first
  puts name
  active_record_state = State.where(name: name).first_or_create
  state.dig(name, 'districts').each do |district_name|
    next if active_record_state.districts.detect{|d| d.name == district_name}
    active_record_state.districts << District.create(name: district_name)
  end
  active_record_state.save
end

people.each do |full_name|
  voter_role = Role.where(role_type: 'voter').first
  candidate_role = Role.where(role_type: 'candidate').first
  first_name, last_name = full_name.split(' ')
  ar_person = Person.where(first_name: first_name, last_name: last_name).first_or_create
  if rand(10) == 9
    next
  elsif rand(50) == 0
    ar_person.roles << candidate_role
  elsif rand(20) == 0
    ar_person.roles << candidate_role
    ar_person.roles << voter_role
  else
    ar_person.roles << voter_role
  end
  state = State.order('RANDOM()').first
  district = state.districts.sample
  ar_person.district = district
  ar_person.save
end

District.all.each_with_index do |district, i|
  #each district gets at least two candidates
  candidate1 = Person.create(first_name: "candidate#{i}a-firstname", last_name: "candidate#{i}a-lastname")
  candidate2 = Person.create(first_name: "candidate#{i}b-firstname", last_name: "candidate#{i}b-lastname")
  candidate_role = Role.where(role_type: 'candidate').first
  candidate1.roles << candidate_role
  candidate2.roles << candidate_role
  district.people << candidate1
  district.people << candidate2
end
