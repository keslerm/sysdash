class System < ActiveRecord::Base
  has_many :heartbeats
  has_many :messages
  has_one :last_heartbeat, -> { order('created_at desc').limit(1) }, class_name: 'Heartbeat'
end
