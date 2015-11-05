class System < ActiveRecord::Base
  has_many :heartbeats
  has_many :messages
end
