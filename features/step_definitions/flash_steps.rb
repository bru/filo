Then /^I should see "([^\"]*)" messages$/ do |flash|
  within("#flash_" + flash) do |content|
    regexp = Regexp.new(".+")
    if content.respond_to? :should
      content.should contain(regexp)
    else
      assert_match(regexp, content)
    end
  end
end