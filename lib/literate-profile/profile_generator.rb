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
      end

      # Gets or sets the path to which to write the profile.
      # 
      # @param path New value to set the path to or +nil+.
      def path(path = nil)
        @path = path unless path.nil?
        @path
      end
    end
  end
end
