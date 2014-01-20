module Homecoming
  class Traversal
    def initialize(dir = Dir.pwd, &block)
      old_length = nil
      while dir != '.' && dir.length != old_length
        yield dir
        old_length = dir.length
        dir = File.dirname(dir)
      end
    end
  end
end