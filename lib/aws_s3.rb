require 'aws-sdk-s3'

# This service should be callable on demand
def scan_for_bounces(service)
  "Scanning S3 for bounce notifications#{service.present? ? " for #{service}" : ''}"
end

