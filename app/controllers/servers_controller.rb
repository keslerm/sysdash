class ServersController < ApplicationController
  before_action :set_server, only: [:edit, :update, :destroy, :show]

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  def show
    # Get server's last 5 heartbeats - i don't care for this solution but it's a test
    last_5 = Heartbeat.order('created_at desc').where(server_id: @server).limit(5)

    @cpu_data = last_5.map { |r| [r.created_at.strftime('%m-%e-%y %H:%M'), r.cpu_usage] }.reverse.to_json
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to '/', notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to '/', notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def average
    render json: Heartbeat.select('avg(cpu_usage) as avg_cpu_usage, avg(mem_used) as avg_mem_used').where(server_id: @server.id)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:name, :token)
    end
end
