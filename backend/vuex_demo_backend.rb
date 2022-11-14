require 'bcrypt'
require 'sinatra'
require 'time'
require 'jwt'
require_relative 'qotd'

MY_SECRET_SIGNING_KEY = "your-256-bit-secret"

class VuexDemoBackend < Sinatra::Base
 
  def initialize
    super
    @db = SQLite3::Database.new('db/jwt_demo.db')
    @db.results_as_hash = true
  end

  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}" #short-circuit logic
    end

    def authenticated?
      bearer = env.fetch('HTTP_AUTHORIZATION', '').slice(7..-1)
      return false unless bearer
      begin
        @token = JWT.decode(bearer, MY_SECRET_SIGNING_KEY, false)
        @user = @db.execute("SELECT * FROM users WHERE id = ?", @token.first['id']).first
        return !!@user
      rescue JWT::DecodeError => ex
        return false
      end
    end
  end

  configure do
    enable :cross_origin
  end
  
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
    content_type :json
  end
  
  #Preflight request
  options "*" do
    response.headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, PATCH, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Location, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Expose-Headers"] = "Location, Link"
    200
  end
  
  #special
  get '/api/v1/reset/?' do
    Seeder.seed!
  end

  #quote of the day
  get '/api/v1/qotd' do
    sleep 1
    {quote: QOTD.quote}.to_json
  end

  #index
  get '/api/v1/users/?' do
    p "-------------------------"
    p env.fetch('HTTP_AUTHORIZATION', '')
    p "-------------------------"

      halt 401, 'Unauthorized' unless authenticated?
      @db.execute('SELECT id, username FROM users').to_json
  end

  #show
  get '/api/v1/users/:id/?' do
      halt 401, 'Unauthorized' unless authenticated?
      @db.execute('SELECT id, username FROM users WHERE id = ? LIMIT 1', params['id']).first.to_json
  end

  #sign in
  post '/api/v1/users/signin' do
    content_type :json

    user_form = JSON.parse(request.body.read)
    p "-------------------------"
    p user_form
    p "-------------------------"

    user = @db.execute('SELECT * FROM users WHERE username = ?', user_form['username']).first
    unless user && BCrypt::Password.new(user['encrypted_password']) == user_form['password']
      [401, ""]
    else

      response = {
        token: JWT.encode({id: user['id'], today_is: Time.now}, MY_SECRET_SIGNING_KEY)
      }
      
      [200, response.to_json]
    end
  end
end