CarrierWave.configure do |config|
    puts "APIKEY == #{ENV['RACKSPACE_API_KEY']}"
	config.fog_credentials = {
      provider: 'Rackspace',
      rackspace_username: 'frazboyz',
      rackspace_api_key: ENV['RACKSPACE_API_KEY'],
      rackspace_region: 'SYD'
  }
  config.asset_host = 'https://ad3caadd296ecc5865d4-c7a4fc71060bc3677d19b0fa5e4f448f.ssl.cf4.rackcdn.com'
  config.fog_directory = 'portfolio'
end