require 'pathname'

module Homecoming
  class Traversal < Enumerator
    def initialize(dir = Dir.pwd, &block)
      super() do |y|
        Pathname(dir).ascend { |p| y.yield p.to_s }
      end
    end
  end
end
