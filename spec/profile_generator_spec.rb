# encoding: UTF-8

# 
# Copyright:: Copyright 2012 by Lifted Studios. All Rights Reserved.
# 

gem 'minitest'

require 'minitest/spec'
require 'minitest/autorun'

require 'literate-profile'

include Literate::Profile

describe ProfileGenerator do
  it 'will have no path or shebang when instantiated' do
    generator = ProfileGenerator.new

    generator.path.must_be_nil
    generator.shebang.must_be_nil
  end

  it 'can have its path set' do
    generator = ProfileGenerator.new

    generator.path 'foo'

    generator.path.must_equal 'foo'
  end

  it 'can have its shebang set' do
    generator = ProfileGenerator.new

    generator.shebang 'foo'

    generator.shebang.must_equal 'foo'
  end

  it 'will output to STDOUT if no path is set' do
    generator = ProfileGenerator.new
    generator.shebang '/bin/zsh'

    proc {
      generator.dump
    }.must_output "#!/bin/zsh\n"
  end
end
