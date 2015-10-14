class Server < ActiveRecord::Base
  has_many :heartbeats
end
