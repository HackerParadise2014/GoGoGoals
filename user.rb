class DmUser
  property :name, String
  property :id, Serial
  has n, :goals
end