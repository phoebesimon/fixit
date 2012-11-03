@logged = false



Then /^(?:I|they|"([^"]*?)") should receive (an|no|\d+) emails?$/ do |address, amount|
  Mail::TestMailer.deliveries.length > 0
end


Then /^the page I should be on is the review page$/ do
  current_path = URI.parse(current_url).path
  /\/requests\/\d+/ =~ current_path
end

When /^I enter "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"/ do |name, phone, email, zone, building, area, description|
  step %{I fill in "request_name" with "#{name}"}
  step %{I fill in "request_phone" with "#{phone}"}
  step %{I fill in "request_email" with "#{email}"}
  step %{I select "#{zone}" from "request_zone"}
  step %{I select "#{building}" from "request_building"}
  step %{I select "#{area}" from "request_area"}
  step %{I fill in "request_description" with "#{description}"}
end

Given /^I have submitted the following requests:$/ do |table|
  table.hashes.each do |request|
    new_request = {}
    area = Area.create!(:name=>request["area"], :building => Building.create!(:name=>request["building"], :zone => Zone.create!(:name =>request["zone"])))
    new_request["area"] = area
    request.each_key do |key|
      if(key == "work request number")
        new_request["id"] = request[key]
      elsif(key == "building")
      elsif(key == "zone")
      elsif(key == "area")
      elsif(key == "date requested")
        new_request["created_at"] = request[key]
      else
        new_request[key] = request[key]
      end
    end
    Request.create!(new_request)
  end
end
Then /^I should puts something$/ do
  puts current_url
end

Then /^(?:|I )should see that my "(.+?)" is "(.+?)"$/ do |fieldname, value|
  text = /#{fieldname}:\s*#{value}/
  #  if page.respond_to? :should
  #   page.should have_content(text), :error => ""
  # else
  match = (text =~ page.body)
  assert_not_equal(match.to_s, '',"The text was: "+text.to_s+". The page was " + page.body)
  #end
end

And /^I should see that "(.+?)", "(.+?)", "(.+?)", "(.+?)" are present$/ do |zone, building, area, description|

  step %{I should see that my "Description" is "#{description}"}
  step %{I should see that my "Zone" is "#{zone}"}
  step %{I should see that my "Building" is "#{building}"}
  step %{I should see that my "Location" is "#{area}"}
  step %{I should see that my "Current Status" is "pending"}

end

Given /^I am not logged in$/ do
  flunk("don't know how to log in through cas yet")
end

Then /^I log in$/ do
  flunk("don't know how to log in yet have to talk to fox")
end

Given /^I am logged in$/ do
  flunk("still don't know how to log in yet")
end

Then /^I should be logged in$/ do
  flunk("don't know how to log in yet, so no")
end


Then /^I should not be logged in$/ do
  assert (@logged == false)
end

Then /^all of the "(.*?)" in "(.*?)" should( not)? be in the "(.*?)" menu$/ do |child_type, parent_name, negate, menu_name|
  puts negate
  if(child_type == "areas")
    parent = Building.find_by_name(parent_name)
    children = Area.find(:all, :conditions => ["building_id = ?", parent.id])
  elsif(child_type=="buildings")
    parent = Zone.find_by_name(parent_name)
    children = Building.find(:all, :conditions => ["zone_id = ?", parent.id])
  else
    flunk
  end
  #get html of drop down menu
  #all names of children should be in the html of drop down menu
  names = children.map do |child|
    child.name
  end
  if(negate == " not")
    assert page.has_no_select?(menu_name, :options=>names)
  else
    assert page.has_select?(menu_name, :options=>names)
  end
end

Then /^"(.*?)" should( not)? be selected from "(.*?)"$/ do |name, negate, menu_name|

  if(negate == " not")
    assert page.has_no_field?(menu_name, :with=>name)
  else
    assert page.has_field?(menu_name, :with=>name)
  end
end

