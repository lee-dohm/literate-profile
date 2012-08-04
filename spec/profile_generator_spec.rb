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
  it 'will have no path when instantiated' do
    generator = ProfileGenerator.new

    generator.path.must_be_nil
  end

  it 'can have its path set' do
    generator = ProfileGenerator.new

    generator.path 'foo'

    generator.path.must_equal 'foo'
  end
end
