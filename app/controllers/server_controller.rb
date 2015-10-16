class ServerController < ApplicationController
  def new
    @server = Server.new
    render 'edit'
  end

  def create
    if @server = Server.create(server_params)
      redirect_to '/'
    else
      flash.now[:danger] = 'There was a problem creating your server'
    end
  end

  private
  def server_params
    params.require(:server).permit(:name, :token)
  end
end

