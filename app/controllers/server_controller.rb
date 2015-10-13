class ServerController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def checkin

    # Find existing server by name
    server = Server.find_by_name_and_token(params[:name], params[:token])

    if (server != nil)
      server.last_checkin = DateTime.now
      server.ip = request.remote_ip

      server.save
      message = 'Success'
    else
      message = 'Unable to authenticate server'
    end

    render :json => { :message => message}
  end
end
