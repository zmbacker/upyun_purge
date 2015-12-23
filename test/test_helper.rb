require 'minitest/autorun'
require 'minitest/pride'

require 'upyun/purge'


# setup global config

Upyun::Purge.setup do |config|

  # bucket name
  config.bucket_name = "bucket_name"

  # operator name
  config.operator_name = "operator_name"

  # operator password
  config.operator_password = "password"

end

# If real_account.rb exist in the test folder the config of upyun can rewrite by it.
# It's usefull by when you want to test the real upyun.
begin
  require "real_account"
rescue LoadError
  print "\nPlease notice: You haven't config infor of upyun account. \n\n"
end