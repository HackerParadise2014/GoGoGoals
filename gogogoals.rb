require 'sinatra'
require 'data_mapper'
require "sinatra-authentication"
require 'haml'
require './routes'
require './user'
require './goal'

use Rack::Session::Cookie, :secret => 'asdfug'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

DataMapper.finalize.auto_migrate!
