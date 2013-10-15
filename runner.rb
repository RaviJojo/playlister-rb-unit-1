require_relative './environment.rb'


parser = LibraryParser.new("#{Dir.pwd}/db/data")

parser.call
