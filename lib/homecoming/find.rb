module Homecoming
  class Find
    def initialize(filename, start_dir = Dir.pwd)
      @start_dir = start_dir
      @filename = filename
    end

    # Returns all found files with the given filename in the current and all
    # parent directories.
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
    def files
      found_files = []
      Traversal.new(@start_dir) do |dir|
        filename = File.join(dir, @filename)
        found_files.unshift filename if File.exist?(filename)
      end
      found_files
    end
  end
end