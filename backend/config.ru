require 'bundler'
Bundler.require

require_relative 'jwt_demo_backend'
require_relative 'db/seeder'

run(JWTDemoBackend)