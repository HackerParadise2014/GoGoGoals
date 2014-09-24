require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

get '/' do
  erb :index
end

class Goal
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :description, String
  property :worked_on, Boolean
  property :date_created, Date
  DataMapper.finalize
end