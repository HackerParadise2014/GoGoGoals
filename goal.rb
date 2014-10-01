class Goal
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :description, Text, :lazy => false
  property :worked_on, Boolean, :required => true, :default => false
  property :date_created, Date
  belongs_to :dm_user
end