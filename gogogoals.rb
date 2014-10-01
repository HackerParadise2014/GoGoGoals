require 'sinatra'
require 'data_mapper'
require "sinatra-authentication"
require 'haml'
use Rack::Session::Cookie, :secret => 'asdfug'
# Routes
get '/' do
  login_required
  @goals = Goal.all
  # View
  haml :index
end

post '/goals' do
  Goal.create params[:goal]
  redirect to('/')
end

# Models
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class DmUser
  property :name, String
#  has n, :goals
end

class Goal
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :description, Text, :lazy => false
  property :worked_on, Boolean, :required => true, :default => false
  property :date_created, Date
#  belongs_to :DmUser
end
 
 DataMapper.finalize