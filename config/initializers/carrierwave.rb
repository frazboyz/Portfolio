CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'Rackspace',
      rackspace_username: 'frazboyz',
      rackspace_api_key: ENV['RACKSPACE_API_KEY'],
      rackspace_region: 'SYD'
  }
  config.fog_directory = 'portfolio'
end