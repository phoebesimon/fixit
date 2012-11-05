# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# seed zone table
zones = [
         {:name => 'Central Ground'},
         {:name => 'Clark Kerr'},
         {:name => 'Dining'},
         {:name => 'ECEP'},
         {:name => 'Family'},
         {:name => 'Family Ground'},
         {:name => 'Other'},
         {:name => 'Unit 1'},
         {:name => 'Unit 2'},
         {:name => 'Unit 3'},
         {:name => 'Unit 4'}
        ]

zones.each do |zone|
  Zone.create!(zone)
end


# seed buildings table
unit2 = Zone.find_by_name('Unit 2')

buildings = [
             {:name => 'Martinez Commons', :zone => unit2},
             {:name => 'Cunningham Hall', :zone => unit2}
             ]

buildings.each do |building|
  Building.create!(building)
end

#unit 1
unit1 = Zone.find_by_name('Unit 1')

buildings = [
             {:name => 'Somewhere', :zone => unit1},
             ]

buildings.each do |building|
  Building.create!(building)
end

# seed areas table
martinez = Building.find_by_name('Martinez Commons')
cunningham = Building.find_by_name('Cunningham Hall')

areas = [
         {:name => '138, Electrical 138', :building => martinez},
         {:name => '190A, Bedroom 190A', :building => martinez},
         {:name => '101, Bedroom 101', :building => cunningham},
         {:name => '102, Bedroom 102', :building => cunningham},
        ]

areas.each do |area|
  Area.create!(area)
end
