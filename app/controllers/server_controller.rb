class ServerController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def heartbeat

    # Find existing server by name
    server = Server.find_by_name_and_token(params[:name], params[:token])

    if (server != nil)
      server.last_heartbeat = DateTime.now
      server.ip = request.remote_ip
      server.save

      # Create new heartbeat record
      heartbeat = Heartbeat.new
      heartbeat.uptime = params[:uptime]
      heartbeat.cpu_usage = params[:cpu_usage]
      heartbeat.server_id = server.id

      heartbeat.save

      render :json => { :message => 'Success'}
    else
      render :status => 401, :json => { :message => 'Unable to authenticate server'}
    end
  end
end
