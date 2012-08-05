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
        @blocks = []
        @indentation_level = 0
      end

      # Dumps the profile.
      def dump
        if @path.nil?
          file = $stdout
        else
          file = File.open(@path, "w")
        end

        begin
          @blocks.each { |block| instance_eval(&block) }
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
        add_text text.rstrip << "\n\n"
      end

      # Gets or sets the path to which to write the profile.
      # 
      # @param path New value to set the path to, if any.
      def path(path = nil)
        @path = path unless path.nil?
        @path
      end

      # Adds a section to the profile.
      # 
      # @param title Title of the section of the profile.
      # @param block Definition of the section of the profile.
      def section(title, &block)
        stars = "*" * @indentation_level
        stars << " " if stars.length > 0
        add_text "# #{stars}#{title}\n"

        @blocks << proc {
          @indentation_level += 1
          instance_eval(&block)
          @indentation_level -= 1
        }
      end

      # Gets or sets the shebang to place at the top of the profile, if any.
      # 
      # @param shebang New value to set for the shebang, if any.
      def shebang(shebang = nil)
        @shebang = shebang unless shebang.nil?
        @shebang
      end

      private

      # Adds some text to the output file.
      # 
      # @param text Text to add to the file.
      def add_text(text)
        @blocks << proc {
          @text = "" if @text.nil?
          @text << text
        }
      end
    end
  end
end
