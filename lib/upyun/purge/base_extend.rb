module Upyun
  module Purge
    module BaseExtend
      def define_attribute( attr_name )

        # define read mehtod for class and instance
        class_eval("        @@#{attr_name} = nil unless defined? @@#{attr_name}

                def self.#{attr_name}
                  @@#{attr_name}
                end
        ", __FILE__, __LINE__ + 1)

        class_eval("          def #{attr_name}
                    @@#{attr_name}
                  end
        ", __FILE__, __LINE__ + 1)

        # define write mehtod for class and instance
        class_eval("        @@#{attr_name} = nil unless defined? @@#{attr_name}

                def self.#{attr_name}=(obj)
                  @@#{attr_name} = obj
                end
        ", __FILE__, __LINE__ + 1)

        class_eval("          def #{attr_name}=(obj)
                    @@#{attr_name} = obj
                  end
        ", __FILE__, __LINE__ + 1)

      end



      def random_string( len = 20 )
        chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
        newpass = ""
        1.upto(len) { |i| newpass << chars[Kernel.rand(chars.size-1)] }
        newpass
      end

      def random_number( len = 20 )
        chars = ("0".."9").to_a
        newpass = ""
        1.upto(len) { |i| newpass << chars[Kernel.rand(chars.size-1)] }
        newpass
      end


    end
  end
end
