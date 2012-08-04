# encoding: UTF-8

# 
# Copyright:: Copyright 2012 by Lifted Studios. All Rights Reserved.
# 

gem 'minitest'

require 'minitest/spec'
require 'minitest/autorun'
require 'pathname'
require 'tempfile'

require 'literate-profile'

include Literate::Profile

describe ProfileGenerator do
  before do
    file = Tempfile.new('foo')
    file.close
    @tempfile = Pathname.new file.path
  end

  after do
    if File.exist? @tempfile.to_s
      File.delete @tempfile.to_s
    end
  end

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

  it 'will not attempt to write a shebang if one is not set' do
    generator = ProfileGenerator.new

    proc {
      generator.dump
    }.must_be_silent
  end

  it 'will output to the path if one is set' do
    generator = ProfileGenerator.new
    generator.shebang '/bin/zsh'

    generator.path @tempfile.to_s
    generator.dump

    File.exist?(@tempfile.to_s).must_equal true
    File.open(@tempfile.to_s) { |file| file.readlines.join("\n").must_equal "#!/bin/zsh\n" }
  end

  it 'will allow output of literal blocks' do
    generator = ProfileGenerator.new

    generator.literal "foo"

    proc {
      generator.dump
    }.must_output "foo\n\n"
  end
end
