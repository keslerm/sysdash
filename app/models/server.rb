class Server < ActiveRecord::Base
  has_many :heartbeats
  has_many :events
end
