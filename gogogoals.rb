require 'sinatra'
require 'data_mapper'


# Routes
get '/' do
  @goals = Goal.all

  # View
  erb :index
end

post '/goals' do
  Goal.create params[:goal]
  redirect to('/')
#  "#{params[:goal]}"
end

# Models
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Goal
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :description, Text, :lazy => false
  property :worked_on, Boolean, :required => true, :default => false
  property :date_created, Date
end
 
 DataMapper.finalize