$LOAD_PATH.unshift(File.expand_path('../lib'))

require 'data_parser'
require 'csv'

file_name = File.expand_path('../data/gschool_commute_data.csv')

data = CSV.read(file_name)

data_without_headers = data[1..-1]

p DataParser.new.parse(data_without_headers)

