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
        @text = nil
      end

      # Dumps the profile.
      def dump
        if @path.nil?
          file = $stdout
        else
          file = File.open(@path, "w")
        end

        begin
          file.puts "#!#{@shebang}" unless @shebang.nil?
          file.puts @text unless @text.nil?
        ensure
          file.close unless file == $stdout
        end
      end

      # Writes literal text to the profile.
      # 
      # @param text Any text at all that should be in the profile.
      def literal(text)
        @text = "" if @text.nil?
        @text << text.rstrip
        @text << "\n\n"
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
