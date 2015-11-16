class EventsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def message
    if (server = System.find_by_name_and_token(params[:name], params[:token]))
      message = Message.new
      message.subject = params[:subject]
      message.body = params[:body]
      message.status = 'New'

      server.messages << message

      server.save

      render :json => { :message => 'Success'}
    else
      render :status => 401, :json => { :message => 'Unable to authenticate server'}
    end
  end

  def heartbeat
    # Find existing server by name
    if (server = System.find_by_name_and_token(params[:name], params[:token]))

      # Create new heartbeat record
      heartbeat = Heartbeat.new
      heartbeat.uptime = params[:uptime]
      heartbeat.cpu_usage = params[:cpu_usage]
      heartbeat.mem_used = params[:mem_used]
      heartbeat.mem_total = params[:mem_total]
      server.heartbeats << heartbeat

      server.ip = request.remote_ip
      server.save

      render :json => { :message => 'Success'}
    else
      render :status => 401, :json => { :message => 'Unable to authenticate server'}
    end
  end
end