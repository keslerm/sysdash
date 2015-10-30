class EventsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    if (server = Server.find_by_name_and_token(params[:name], params[:token]))
      event = Event.new
      event.message = params[:message]
      event.status = 'New'

      server.events << event

      server.save

      render :json => { :message => 'Success'}
    else
      render :status => 401, :json => { :message => 'Unable to authenticate server'}
    end
  end
end
