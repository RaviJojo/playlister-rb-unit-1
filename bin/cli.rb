require_relative '../environment.rb'


# load via parser
# boot the CLI


parser = LibraryParser.new("/Users/josephoconor/flatiron/labs/ruby-003-unit-1/playlister/db/data")
array = parser.call

cli = PlaylisterCLI.new(array)
cli.call