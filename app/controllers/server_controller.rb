class ServerController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def checkin

    # Find existing server by name
    server = Server.find_by_name(params[:name])

    if (server != nil and server.password == params[:password])
      server.last_checkin = DateTime.now
      server.ip = params[:ip]

      server.save
      message = 'Success'
    else
      message = 'Unable to authenticate server'
    end

    render :json => { :message => message}
  end
end