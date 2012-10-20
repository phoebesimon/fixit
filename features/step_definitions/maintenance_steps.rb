@logged = false

When /^I enter "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)"/ do |name, phone, email, zone, building, area, description|
  step %{I fill in "request_name" with "#{name}"}
  And %{I fill in "request_phone" with "#{phone}"}
  And %{I fill in "request_email" with "#{email}"}
  And %{I fill in "zone" with "#{zone}"}
  And %{I fill in "building" with "#{building}"}
  And %{I fill in "area" with "#{area}"}
  And %{I fill in "description" with "#{description}"}
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
  text = "#{fieldname}: #{value}"
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

And /^I should see that "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)", "(.+?)" are present$/ do |name, phone, email, zone, building, area, description|

  And %{I should see that my "name" is "#{name}"}
  And %{I should see that my "phone number" is "#{phone}"}
  And %{I should see that my "email" is "#{email}"}
  And %{I should see that my "zone" is "#{email}"}
  And %{I should see that my "building" is "#{building}"}
  And %{I should see that my "area" is "#{area}"}
  And %{I should see that my "description" is "#{decription}"}
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

