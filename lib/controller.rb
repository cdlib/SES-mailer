get '/' do
  # TODO: If we go with GraphQL we should probably replace this file with the GraphQL root or redirect there
  'Welcome to the SES Mailer service.' + scan_for_bounces
end
