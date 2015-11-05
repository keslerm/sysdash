class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    # Don't know if this is the best way to do this, could possibly pull the wrong heartbeat
    @systems = System.joins('LEFT OUTER JOIN heartbeats ON systems.id = heartbeats.system_id').includes(:heartbeats).where('systems.last_heartbeat = heartbeats.created_at or systems.last_heartbeat is null').order(:name)
  end

end
