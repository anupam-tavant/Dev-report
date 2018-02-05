# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Load the app's custom environment variables here, so that they are loaded before environments/*.rb
env = File.join(Rails.root, 'config', 'env.rb')
load(env) if File.exists?(env)