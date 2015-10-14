class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    # Don't know if this is the best way to do this, could possibly pull the wrong heartbeat
    @servers = Server.joins(:heartbeats).where('servers.last_heartbeat = heartbeats.created_at')
  end

end
