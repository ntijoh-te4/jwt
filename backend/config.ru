require 'bundler'
Bundler.require

require_relative 'vuex_demo_backend'
require_relative 'db/seeder'

run(VuexDemoBackend)