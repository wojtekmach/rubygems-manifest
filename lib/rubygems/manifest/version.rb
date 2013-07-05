module Rubygems
  class Manifest
    VERSION = File.read(File.expand_path('../../../../VERSION', __FILE__)).strip
  end
end
