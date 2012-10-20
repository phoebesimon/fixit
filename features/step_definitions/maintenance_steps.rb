@logged = false

Then /^the page I should be on is the review page$/ do
  current_path = URI.parse(current_url).path
  /\/requests\/\d+/ =~ current_path
end

When /^I enter "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)"/ do |name, phone, email, zone, building, area, description|
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
    request.each_key do |key|
      if(key == "phone number")
        new_request["phone"] = request[key]
      elsif(key == "work request number")
        new_request["request_number"] = request[key]
      elsif(key == "date requested")
        new_request["created_at"] = request[key]
      else
        new_request[key] = request[key]
      end
    end
    Request.create!(new_request)
  end
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

And /^I should see that "(.+?)", "(.+?)", "(.+?)", "(.+?)" are present$/ do |name, phone, email, zone, building, area, description|

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

