@logged = false

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

