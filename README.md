# Homecoming

Homecoming let's you easily traverse all parent directories of a given or
the current directory.

This comes in handy when searching for a config file
with settings that can be overridden by the same config file in a lower level
directory (a popular example being `.gitignore`).


## Installation

Add this line to your application's Gemfile:

    gem 'homecoming'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install homecoming


## Usage

### Finding files

`Homecoming.find` searches for a given filename in the current and all parent
directories.

    # Given the following directory structure:

    /
      home/
        rrrene/
          projects/
            your_project/
              .yourconfig
          .yourconfig

    Homecoming.find(".yourconfig", "/home/rrrene/projects/your_project")
    # => ["/home/rrrene/.yourconfig",
          "/home/rrrene/projects/your_project/.yourconfig"]

If no path is given as second parameter, the current directory is the
starting point of the traversal.

### Traversing parents

`Homecoming.each` traverses and yields the given and all parent
directories.

    Homecoming.each("/home/rrrene/projects/your_project") do |dir|
      # ...
    end

If no path is given, the current directory is the starting point of the
traversal.

In our example, this would yield the following directories beginning with the
given/current one:

    "/home/rrrene/projects/your_project"
    "/home/rrrene/projects"
    "/home/rrrene"
    "/home"
    "/"


## Contributing

1. Fork it ( http://github.com/<my-github-username>/homecoming/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Author

René Föhring (@rrrene)


## License

Homecoming is released under the MIT License. See the LICENSE.txt file for further
details.
