require "rubygems/manifest/version"

module Rubygems
  class Manifest
    def initialize(filename = ENV['MANIFEST'] || 'Manifest.txt')
      @filename = filename
    end

    def files
      @files ||= `git ls-files`.split($/)
    end

    def executables
      files.grep(%r{^bin/}) { |f| File.basename(f) }
    end

    def test_files
      files.grep(%r{^(test|spec|features)/})
    end

    def tests
      files.grep(%r{^(test|spec|features)(.*)(_test.rb|_spec.rb|\.feature)$})
    end

    def read
      File.read(@filename).split("\n")
    end

    def save
      File.open(@filename, 'w') { |f| f.puts(files) }
    end

    def check
      str = diff_str

      unless str == ''
        fail "Difference:\n\n#{str}\n"
      end
    end

    def diff
      [read - files, files - read]
    end

    def diff_str
      additions, deletions = diff

      str = ''
      deletions.each { |file| str << "-#{file}\n" }
      additions.each { |file| str << "+#{file}\n" }
      str
    end
  end
end
