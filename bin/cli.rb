require_relative '../environment.rb'


# load via parser
# boot the CLI


parser = LibraryParser.new(DATA_PATH)
array = parser.call

cli = PlaylisterCLI.new(array)
cli.call