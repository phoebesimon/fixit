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
unit1 = Zone.find_by_name('Unit 1')
unit2 = Zone.find_by_name('Unit 2')
unit3 = Zone.find_by_name('Unit 3')
unit4 = Zone.find_by_name('Unit 4')
clark_kerr = Zone.find_by_name('Clark Kerr')
central_grounds = Zone.find_by_name('Central Ground')
ecep = Zone.find_by_name('ECEP')
dining = Zone.find_by_name('Dining')
family = Zone.find_by_name('Family')
family_grounds = Zone.find_by_name('Family Ground')

buildings = [

             {:name => 'Central 1', :zone=> unit1},
             {:name => 'Channing Bowditch', :zone=> unit1},
             {:name => 'Channing Bowditch Ground', :zone=> unit1},
             {:name => 'Cheney Hall', :zone=> unit1},
             {:name => 'Christian Hall', :zone=> unit1},
             {:name => 'Deutsch Hall', :zone=> unit1},
             {:name => 'Freeborn Hall', :zone=> unit1},
             {:name => 'Ida Jackson House', :zone=> unit1},
             {:name => 'Putnam Hall', :zone=> unit1},
             {:name => 'Slottman Hall', :zone=> unit1},
             {:name => 'Unit 1 All Buildings', :zone=> unit1},
             {:name => 'Unit 1 Ground', :zone=> unit1},

             {:name => 'Central 2 ', :zone=> unit2},
             {:name => 'Cunningham Hall', :zone=> unit2},
             {:name => 'Davidson Hall', :zone=> unit2},
             {:name => 'Ehrman Hall', :zone=> unit2},
             {:name => 'Griffiths Hall', :zone=> unit2},
             {:name => 'Towle Hall', :zone=> unit2},
             {:name => 'Unit 2 All Buildings', :zone=> unit2},
             {:name => 'Unit 2 Ground', :zone=> unit2},
             {:name => 'Wada Hall', :zone=> unit2},
             {:name => 'Martinez Commons', :zone=> unit2},


             {:name => 'Beverly Cleary Ground', :zone=> unit3},
             {:name => 'Beverly Cleary Hall', :zone=> unit3},
             {:name => 'Central 3', :zone=> unit3},
             {:name => 'Ida Sproul Hall', :zone=> unit3},
             {:name => 'Manville Ground', :zone=> unit3},
             {:name => 'Manville Hall', :zone=> unit3},
             {:name => 'Norton Hall', :zone=> unit3},
             {:name => 'Priestley Hall', :zone=> unit3},
             {:name => 'Spens Black Hall', :zone=> unit3},
             {:name => 'Unit 3 All Buildings', :zone=> unit3},
             {:name => 'Unit 3 Ground', :zone=> unit3},

             {:name => 'Bowles Ground', :zone=> unit4},
             {:name => 'Bowles Hall', :zone=> unit4},
             {:name => 'FH Building 1', :zone=> unit4},
             {:name => 'FH Building 2', :zone=> unit4},
             {:name => 'FH Building 3', :zone=> unit4},
             {:name => 'FH Building 4', :zone=> unit4},
             {:name => 'FH Building 5', :zone=> unit4},
             {:name => 'FH Building 6', :zone=> unit4},
             {:name => 'FH Building 7', :zone=> unit4},
             {:name => 'FH Building 8', :zone=> unit4},
             {:name => 'FH Building 9', :zone=> unit4},
             {:name => 'Foothill All Buildings', :zone=> unit4},
             {:name => 'Foothill Ground', :zone=> unit4},
             {:name => 'Stern Ground', :zone=> unit4},
             {:name => 'Stern Hall', :zone=> unit4},


             {:name => 'CK Building 1', :zone=> clark_kerr},
             {:name => 'CK Building 2', :zone=> clark_kerr},
             {:name => 'CK Building 3', :zone=> clark_kerr},
             {:name => 'CK Building 4', :zone=> clark_kerr},
             {:name => 'CK Building 6', :zone=> clark_kerr},
             {:name => 'CK Building 7', :zone=> clark_kerr},
             {:name => 'CK Building 8', :zone=> clark_kerr},
             {:name => 'CK Building 9', :zone=> clark_kerr},
             {:name => 'CK Building 11', :zone=> clark_kerr},
             {:name => 'CK Building 12', :zone=> clark_kerr},
             {:name => 'CK Building 13', :zone=> clark_kerr},
             {:name => 'CK Building 16', :zone=> clark_kerr},
             {:name => 'CK Building 17', :zone=> clark_kerr},
             {:name => 'CK Building 18', :zone=> clark_kerr},
             {:name => 'CK Building 19', :zone=> clark_kerr},
             {:name => 'CK Building 20', :zone=> clark_kerr},
             {:name => 'Clark Kerr Campus All Buildings', :zone=> clark_kerr},
             {:name => 'Clark Kerr Ground', :zone=> clark_kerr},

             {:name => 'Beverly Cleary Ground', :zone=> central_grounds},
             {:name => 'Bowles Ground', :zone=> central_grounds},
             {:name => 'Central Ground', :zone=> central_grounds},
             {:name => 'Channing Bowditch Ground', :zone=> central_grounds},
             {:name => 'Clark Kerr Ground', :zone=> central_grounds},
             {:name => 'Foothill Ground', :zone=> central_grounds},
             {:name => 'Ida Jackson Ground', :zone=> central_grounds},
             {:name => 'Manville Ground', :zone=> central_grounds},
             {:name => 'RSSB Ground', :zone=> central_grounds},
             {:name => 'Stern Ground', :zone=> central_grounds},
             {:name => 'Unit 1 Ground', :zone=> central_grounds},
             {:name => 'Unit 2 Ground', :zone=> central_grounds},
             {:name => 'Unit 3 Ground', :zone=> central_grounds},

             {:name => 'Cafe3', :zone=> dining},
             {:name => 'CK Building 10', :zone=> dining},
             {:name => 'CK Building 14', :zone=> dining},
             {:name => 'Common Grounds', :zone=> dining},
             {:name => 'Crossroads', :zone=> dining},
             {:name => 'FH Building 4', :zone=> dining},
             {:name => 'Golden Bear Restaurant', :zone=> dining},
             {:name => 'LBL', :zone=> dining},
             {:name => 'Pat Brown\'s Grill', :zone=> dining},
             {:name => 'Ramona\'s Cafe', :zone=> dining},
             {:name => 'RSF Pro Shop', :zone=> dining},
             {:name => 'Terrace Cafe', :zone=> dining},
             {:name => 'QualComm', :zone=> dining},
             {:name => 'Haas Pavillion', :zone=> dining},
             {:name => 'Memorial Stadium', :zone=> dining},
             {:name => 'LHS Cafe', :zone=> dining},



             {:name => 'Anna Head', :zone=> ecep},
             {:name => 'CK Building 5', :zone=> ecep},
             {:name => 'CK Building 15', :zone=> ecep},
             {:name => 'CK Building 5a (temp)', :zone=> ecep},
             {:name => 'Girton Hall', :zone=> ecep},
             {:name => 'Haste St. Child Development Center', :zone=> ecep},
             {:name => 'Infant Toddler Center', :zone=> ecep},
             {:name => 'Jones Study Center', :zone=> ecep},


             {:name => 'Academic Center (temp)', :zone => family},
             {:name => 'Childcare Center', :zone => family},
             {:name => 'Community Center', :zone => family},
             {:name => 'Maintenance Shops', :zone => family},
             {:name => 'SF Building 3002', :zone => family},
             {:name => 'SF Building 3024', :zone => family},
             {:name => 'SF Building E', :zone => family},
             {:name => 'SF Building F', :zone => family},
             {:name => 'SF Building G', :zone => family},
             {:name => 'SF Building H', :zone => family},
             {:name => 'SF Building J', :zone => family},
             {:name => 'SF Building K (G/H Annex)', :zone => family},
             {:name => 'SF Building L (E/F Annex)', :zone => family},
             {:name => 'SF Central Building', :zone => family},
             {:name => 'SF Community Center (temp)', :zone => family},
             {:name => 'Smyth Fernwald All Buildings', :zone => family},
             {:name => 'Smyth Ground', :zone => family},
             {:name => 'UV East Ground', :zone => family},
             {:name => 'UV West Ground', :zone => family},
             {:name => 'UVA All Buildings', :zone => family},
             {:name => 'UVA All Buildings East Village', :zone => family},
             {:name => 'UVA -EV Parking', :zone => family},
             {:name => 'UVA Ground', :zone => family},
             {:name => 'Grounds shop', :zone => family},
             {:name => 'UVA-EV Building 100', :zone => family},
             {:name => 'UVA-EV Building 101', :zone => family},
             {:name => 'UVA-EV Building 102', :zone => family},
             {:name => 'UVA-EV Building 103', :zone => family},
             {:name => 'UVA-EV Building 104', :zone => family},
             {:name => 'UVA-EV Building 105', :zone => family},
             {:name => 'UVA-EV Building 106', :zone => family},
             {:name => 'UVA-EV Building 107', :zone => family},
             {:name => 'UVA-EV Building 108', :zone => family},
             {:name => 'UVA-EV Building 109', :zone => family},
             {:name => 'UVA-EV Building 110', :zone => family},
             {:name => 'UVA-EV Building 111', :zone => family},
             {:name => 'UVA-EV Building 112', :zone => family},
             {:name => 'UVA-EV Building 113', :zone => family},
             {:name => 'UVA-EV Building 114', :zone => family},
             {:name => 'UVA-EV Building 115', :zone => family},
             {:name => 'UVA-EV Building 116', :zone => family},
             {:name => 'UVA-EV Building 117', :zone => family},
             {:name => 'UVA-EV Building 118', :zone => family},
             {:name => 'UVA-EV Building 119', :zone => family},
             {:name => 'UVA-EV Building 120', :zone => family},
             {:name => 'UVA-EV Building 121', :zone => family},
             {:name => 'UVA-EV Building 122', :zone => family},
             {:name => 'UVA-EV Building 123', :zone => family},
             {:name => 'UVA-EV Building 124', :zone => family},
             {:name => 'UVA-EV Building 125', :zone => family},
             {:name => 'UVA-EV Building 126', :zone => family},
             {:name => 'UVA-EV Building 127', :zone => family},
             {:name => 'UVA-EV Building 128', :zone => family},
             {:name => 'UVA-EV Building 129', :zone => family},
             {:name => 'UVA-EV Building 130', :zone => family},
             {:name => 'UVA-EV Building 131', :zone => family},
             {:name => 'UVA-EV Building 132', :zone => family},
             {:name => 'UVA-EV Building 133', :zone => family},
             {:name => 'UVA-EV Building 134', :zone => family},
             {:name => 'UVA-EV Building 135', :zone => family},
             {:name => 'UVA-EV Building 136', :zone => family},
             {:name => 'UVA-EV Building 137', :zone => family},
             {:name => 'UVA-EV Building 138', :zone => family},
             {:name => 'UVA-EV Building 139', :zone => family},
             {:name => 'UVA-EV Building 140', :zone => family},
             {:name => 'UVA-EV Building 141', :zone => family},
             {:name => 'UVA-EV Building 142', :zone => family},
             {:name => 'UVA-EV Building 143', :zone => family},
             {:name => 'UVA-EV Building 144', :zone => family},
             {:name => 'UV-EV-L Laundry L1', :zone => family},
             {:name => 'UV-EV-L Laundry L2', :zone => family},
             {:name => 'UV-EV-L Laundry L3', :zone => family},
             {:name => 'UV-EV-L Laundry L4', :zone => family},
             {:name => 'UV-EV-L Laundry L5', :zone => family},
             {:name => 'UV-EV-L Laundry L6', :zone => family},
             {:name => 'UV-EV-L Laundry L7', :zone => family},
             {:name => 'UV-EV-L Laundry L8', :zone => family},
             {:name => 'UV-EV-L Laundry L9', :zone => family},
             {:name => 'UV-EV-L Laundry L10', :zone => family},
             {:name => 'UVA-WV Building 137', :zone => family},
             {:name => 'UVA-WV Building 138', :zone => family},
             {:name => 'UVA-WV Building 142', :zone => family},
             {:name => 'UVA-WV Building 145', :zone => family},
             {:name => 'UVA-WV Building 146', :zone => family},
             {:name => 'UVA-WV Building 147', :zone => family},
             {:name => 'UVA-WV Building 148', :zone => family},
             {:name => 'UVA-WV Building 149', :zone => family},
             {:name => 'UVA-WV Building 150', :zone => family},
             {:name => 'UVA-WV Building 151', :zone => family},
             {:name => 'UVA-WV Building 152', :zone => family},
             {:name => 'UVA-WV Building 153', :zone => family},
             {:name => 'UVA-WV Building 154', :zone => family},
             {:name => 'UVA-WV Building 155', :zone => family},
             {:name => 'UVA-WV Building 156', :zone => family},
             {:name => 'UVA-WV Building 157', :zone => family},
             {:name => 'UVA-WV Building 158', :zone => family},
             {:name => 'UVA-WV Building 159', :zone => family},
             {:name => 'UVA-WV Building 160', :zone => family},
             {:name => 'UVA-WV Building 161', :zone => family},
             {:name => 'UVA-WV Building 162', :zone => family},
             {:name => 'UVA-WV Building 163', :zone => family},
             {:name => 'UVA-WV Building 164', :zone => family},
             {:name => 'UVA-WV Building 165', :zone => family},
             {:name => 'UVA-WV Building 166', :zone => family},
             {:name => 'UVA-WV Building 167', :zone => family},
             {:name => 'UVA-WV Building 168', :zone => family},
             {:name => 'UVA-WV Building 169', :zone => family},
             {:name => 'UVA-WV Building 170', :zone => family},
             {:name => 'UVA-WV Parking Lot', :zone => family},
             {:name => 'UVW All Buildings', :zone => family},
             {:name => 'Village Office', :zone => family},


             {:name => 'Smyth Ground', :zone => family_grounds},
             {:name => 'UV East Ground', :zone => family_grounds},
             {:name => 'UV West Ground', :zone => family_grounds},
             {:name => 'UVA Ground', :zone => family_grounds}


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

admin_users = [
               {:uid => "873123", :admin_flag=> true}
             ]
admin_users.each do |admin_user|
  User.create!(admin_user)
end
