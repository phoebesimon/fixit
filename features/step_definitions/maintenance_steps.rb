Then /^(?:|I )should see that my "(.+?)" is "(.+?)"$/ do |fieldname, value|
  text = "#{fieldname}: #{value}"
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


