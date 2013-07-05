require 'minitest/autorun'
require 'rubygems/manifest'

describe Rubygems::Manifest do
  let(:manifest) { Rubygems::Manifest.new }

  it "returns files" do
    manifest.files.must_include 'lib/rubygems/manifest.rb'
  end

  it "does not return files that are ignored" do
    manifest.files.wont_include 'tmp/test.txt'
  end

  it "returns executables" do
    manifest.executables.must_equal ['manifest']
  end
end
