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

