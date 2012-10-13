Given /^I have submitted the following requests:$/ do |table|
  requests_table.hashes.each do |request|
    new_request = {}
    request.each_key do |key|
      if(key == "phone number")
        new_request["phone"] = request[key]
      elsif(key == "work request number")
        new_request["request_number"] = request[key]
      else
        new_request[key] = request[key]
      end
    end
    Request.create!(new_request)
  end
end


Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(:title => movie["title"],:rating => movie["rating"], :release_date => movie["release_date"], :director => movie["director"])



Then /^(?:|I )should see that my "(.+?)" is "(.+?)"$/ do |fieldname, value|
  text = "#{fieldname}: #{value}"
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

