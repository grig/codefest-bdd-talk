$KCODE = 'u'

Given /я зарегистрирован в twitter как "([^"]*)"/ do |username|
  # todo
end

When /я запрашиваю ленту пользователя "([^"]*)"/ do |username|
  get "/#{username}"
end

Then /я должен увидеть пустую ленту/ do |text|
  assert_xpath "not(//div[id='status'])"
end

def get(url)
  raise IOError, "Connection to localhost failed"
end

