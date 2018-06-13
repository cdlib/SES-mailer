require 'json'
require 'sinatra'

# Configuration
# -----------------------------------
configure do
  enable :logging
end

configure :production do
  # Production specific config options
end

begin
  # Pull in the configuration params and assign them to the config hash
  CONFIG = JSON.parse(File.read('config.json'))
rescue JSON::ParserError
  puts "Unable to read your config.json file. Please make sure it is valid JSON."
end

# Pull together all of the code from ./lib
Dir.glob("lib/*.rb").each { |r| require_relative r }

# Helpers
# -----------------------------------
def get_config(key)
  # Returns local environment variable or config.json value if available
  ENV[key].nil? ? CONFIG[key] : ENV[key]
end