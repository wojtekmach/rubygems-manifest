require 'rubygems/manifest'
require 'optparse'

module Rubygems
  class Manifest
    class CLI
      def self.start
        new.start
      end

      def start
        opts = OptionParser.new
        opts.banner = "Usage: manifest [commands] [options]\n"
        opts.banner << "\n"
        opts.banner << "Commands:\n"
        opts.banner << ("    save".ljust(37))  + "Save to Manifest.txt [default]\n"
        opts.banner << ("    check".ljust(37)) + "Check Manifest.txt\n"

        opts.banner << "\n"
        opts.banner << "Options:\n"

        opts.on("-v", "--version", "Print version") do
          puts Rubygems::Manifest::VERSION
          exit(0)
        end

        opts.parse!

        manifest = Rubygems::Manifest.new

        if ARGV[0] == nil || ARGV[0] == 'save'
          manifest.save

          if manifest.files.none?
            puts yellow("Manifest is empty")
          else
            puts manifest.files
            $stderr.puts green("Manifest is saved successfully")
          end
        elsif ARGV[0] == 'check'
          begin
            manifest.check

            if manifest.files.none?
              puts yellow("Manifest is empty")
            else
              puts manifest.files
              $stderr.puts green("Manifest is valid")
            end
          rescue => e
            puts e.message
            $stderr.puts red("Manifest is invalid")
            exit 1
          end
        else
          puts opts
        end
      end

      def green(str)
        color(str, 32)
      end

      def red(str)
        color(str, 31)
      end

      def yellow(str)
        color(str, 33)
      end

      def color(str, n)
        "\e[#{n}m#{str}\e[0m"
      end
    end
  end
end
