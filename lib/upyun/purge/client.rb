module Upyun
  module Purge
    class Client

      attr_accessor :urls

      attr_accessor :bucket_name, :operator_name, :operator_password

      def initialize( option={} )
        @bucket_name = option[:bucket_name] || Upyun::Purge.bucket_name
        @operator_name = option[:operator_name] || Upyun::Purge.operator_name
        @operator_password = option[:operator_password] || Upyun::Purge.operator_password
      end

      def purge( urls = nil)
        @urls = urls.is_a?(Array) ? urls : [urls]
        @urls = @urls.compact

        uri = URI(Upyun::Purge.api_server)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data( purge: @urls.join("\n") )
        request['Authorization'] = auth_header
        request['Date'] = Time.now
        response = http.request(request)
        case response
        when Net::HTTPSuccess
          return JSON.parse(response.body)
        else
          raise Exception.new "\n\tRequest uri:#{uri.request_uri} \n\tResponse code: #{response.code} \n\tMessage: #{response.body}"
        end

      end




      def make_signature
        _urls = @urls.join("\n")
        datetime = Time.now
        second_str = [_urls,@bucket_name, datetime, md5(@operator_password)].join("&")
        sign = md5(second_str)
        sign
      end

      def auth_header
        "UpYun #{@bucket_name}:#{@operator_name}:#{make_signature}"
      end

      def md5( str )
        Digest::MD5.hexdigest str
      end

    end
  end
end
