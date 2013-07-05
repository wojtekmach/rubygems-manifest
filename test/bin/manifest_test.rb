require 'minitest/autorun'
require 'rubygems/manifest'
require 'tmpdir'

describe "bin/manifest" do
  describe "--version" do
    it "prints current version" do
      command("--version").strip.must_equal Rubygems::Manifest::VERSION
    end
  end

  def self.it(*args, &block)
    super(*args, &proc { in_tmp_dir(&block) })
  end

  describe "check" do
    it "prints warning when manifest is empty" do
      `touch a.txt`
      command('save')

      command('check').must_include "Manifest is empty"
      $?.success?.must_equal true
    end

    it "prints manifest when it's successful" do
      `touch a.txt`
      `git add .`
      command('save')

      command('check').must_equal "Manifest.txt\na.txt\n"
      $?.success?.must_equal true
    end

    it "prints difference when it failed" do
      `touch a.txt`
      `git add .`
      command('save')

      `touch b.txt`
      `git add .`
      command('check').must_equal "Difference:\n\n-b.txt\n\n"
      $?.success?.must_equal false
    end
  end

  describe "save" do
    it "saves Manifest.txt" do
      `touch a.txt`
      `git add .`
      command('save')

      File.read('Manifest.txt').must_equal "Manifest.txt\na.txt\n"
    end

    it "prints the manifest" do
    end
  end

  private

  BIN = File.expand_path('../../../bin/manifest', __FILE__)

  def in_tmp_dir(&block)
    Dir.mktmpdir('rubygems-manifest') do |dir|
      Dir.chdir(dir)
      `git init`
      `touch Manifest.txt`
      instance_eval(&block)
    end
  end

  def command(*args)
    `#{BIN} #{args.join(' ')} 2> /dev/null`
  end
end
