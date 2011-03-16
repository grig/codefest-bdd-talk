require 'test/unit/assertions'
include Test::Unit::Assertions

Given /я зарегистрирован в twitter как "([^"]*)"/ do |username|
  # todo
end

When /я запрашиваю ленту пользователя "([^"]*)"/ do |username|
  get "/#{username}"
end

Then /я должен увидеть пустую ленту/ do
  assert_xpath "//div[@id='timeline' and not(.//div[@id='status'])"
end

def get(url)

end

def assert_response(expected)
  assert false, "expected response status to be #{expected}, got: '404 Not Found'"
end

def assert_xpath(xpath)
  assert false, "expected response text to match #{xpath.inspect}, actual: #{"".inspect}"
end
