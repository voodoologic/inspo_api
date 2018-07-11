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
  puts full_name
  first_name, last_name = full_name.split(' ')
  ar_person = Person.where(first_name: first_name, last_name: last_name).first_or_create
  state = State.order('RANDOM()').first
  district = state.districts.sample
  ar_person.district = district
  ar_person.save
end

