class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    # Don't know if this is the best way to do this, could possibly pull the wrong heartbeat
    @servers = Server.joins('LEFT OUTER JOIN heartbeats ON servers.id = heartbeats.server_id').includes(:heartbeats).where('servers.last_heartbeat = heartbeats.created_at or servers.last_heartbeat is null')
  end

end
