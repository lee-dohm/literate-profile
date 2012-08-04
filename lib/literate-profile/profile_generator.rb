# encoding: UTF-8

# 
# Copyright:: Copyright 2012 by Lifted Studios. All Rights Reserved.
# 

module Literate
  module Profile
    # Generates the actual profile from the specification.
    class ProfileGenerator
      # Initializes a new instance of the +ProfileGenerator+ class.
      def initialize
        @path = nil
        @shebang = nil
      end

      # Dumps the profile.
      def dump
        puts "#!#{@shebang}"
      end

      # Gets or sets the path to which to write the profile.
      # 
      # @param path New value to set the path to, if any.
      def path(path = nil)
        @path = path unless path.nil?
        @path
      end

      # Gets or sets the shebang to place at the top of the profile, if any.
      # 
      # @param shebang New value to set for the shebang, if any.
      def shebang(shebang = nil)
        @shebang = shebang unless shebang.nil?
        @shebang
      end
    end
  end
end
