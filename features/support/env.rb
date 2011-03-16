$KCODE = 'u'
require "#{File.dirname(__FILE__)}/server"

Server.start
at_exit do
  Server.stop
end
