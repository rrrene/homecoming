require "homecoming/find"
require "homecoming/traversal"
require "homecoming/version"

# Homecoming searches for a given filename in the current and all parent
# directories.
#
#   # Given the following directory structure:
#
#   /
#     home/
#       rrrene/
#         projects/
#           your_project/
#             .yourconfig
#         .yourconfig
#
#   Homecoming.find(".yourconfig", "/home/rrrene/projects/your_project")
#   # => ["/home/rrrene/.yourconfig",
#         "/home/rrrene/projects/your_project/.yourconfig"]
#
# If no path is given as second parameter, the current directory is the
# starting point of the traversal.
#
module Homecoming
  def self.find(filename, path = Dir.pwd)
    Homecoming::Find.new(filename, path).files
  end

  def self.each(path = Dir.pwd, &block)
    Homecoming::Traversal.new(path).each(&block)
  end
end
