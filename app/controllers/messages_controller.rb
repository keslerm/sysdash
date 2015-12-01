class MessagesController < ApplicationController
  before_action :set_server, only: [:destroy, :show]
  before_action :authenticate_user

  def index
    @messages = Message.includes(:system).order(:created_at).all
  end

  def show
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_path, notice: 'Message was removed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_server
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def server_params
    #params.require(:message).permit(:name, :token)
  end
end
