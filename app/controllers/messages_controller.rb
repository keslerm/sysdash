class MessagesController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: [:create]

  def create
    if (server = Server.find_by_name_and_token(params[:name], params[:token]))
      message = Message.new
      message.message = params[:message]
      message.status = 'New'

      server.messages << message

      server.save

      render :json => { :message => 'Success'}
    else
      render :status => 401, :json => { :message => 'Unable to authenticate server'}
    end
  end
end
