require 'sinatra'

configure do
  # TODO: Add method to swap in credentials for DB and AWS when deployed
  # ----------------------------------------

  config = { 
    aws: {
      region: 'region-zone-nbr',
      key: 'ABCD1234',
      secret: 'SECRET123'
    },
    db: {
      host: 'my-database.example.org'
    }
  }
end

configure :production do
  # Production specific config options
  enable :logging
end

# Pull together all of the code
Dir.glob("lib/*.rb").each { |r| require_relative r }
