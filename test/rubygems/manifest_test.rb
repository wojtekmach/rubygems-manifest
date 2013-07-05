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

  it "returns all test files" do
    manifest.test_files.must_include 'test/test_helper.rb'
    manifest.test_files.must_include 'test/rubygems/manifest_test.rb'
  end

  it "returns tests" do
    manifest.tests.wont_include 'test/test_helper.rb'
    manifest.tests.must_include 'test/rubygems/manifest_test.rb'
  end
end
