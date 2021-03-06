require "upyun/purge/version"
require "upyun/purge/base_extend"
require "upyun/purge/client"
require "json"

module Upyun
  module Purge
    extend BaseExtend

    # bucket_name
    define_attribute :bucket_name
    @@bucket_name = nil

    # operator_name
    define_attribute :operator_name
    @@operator_name = nil

    # operator_password
    define_attribute :operator_password
    @@operator_password = nil

    # api server
    define_attribute :api_server
    @@api_server = "http://purge.upyun.com/purge/"

    # setup upyun base info
    def self.setup
      yield self
    end



    def self.new( hash = {} )
      Client.new( hash )
    end

  end
end
