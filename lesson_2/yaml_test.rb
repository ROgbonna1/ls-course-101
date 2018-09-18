require 'yaml'
require 'pry'

TEST_HASH = YAML.load_file('test.yml')
binding.pry