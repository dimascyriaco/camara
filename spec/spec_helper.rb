require 'coveralls'
Coveralls.wear!

require 'pry'
require 'rspec/collection_matchers'
require 'rspec/expectations'
require 'vcr'

require 'camara'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock # or :fakeweb
end
