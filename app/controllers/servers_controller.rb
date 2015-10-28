class ServersController < ApplicationController
  before_action :set_server, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user

  # GET /servers/new
  def new
    @server = Server.new
  end

  def index
    @servers = Server.all
  end

  # GET /servers/1/edit
  def edit
  end

  def show
    # I'm not sure this is the best solution here if a server has millions of heartbeats.
    if @server.heartbeats.length == 0
      return
    end

    time_period = 30.minutes

    if params[:timeperiod] != nil
      time_period = 30.minutes if params[:timeperiod] == '1'
      time_period = 2.hours if params[:timeperiod] == '2'
      time_period = 24.hours if params[:timeperiod] == '3'
      time_period = 1.week if params[:timeperiod] == '4'
    end

    heartbeats = Heartbeat.where(server_id: @server).where('created_at >= ?', Heartbeat.where(server_id: @server).maximum('created_at') - time_period).order('created_at')

    @cpu_data = []
    @memory_data = []
    @timestamps = []

    #@cpu_data = last_30_minutes.map { |r| [r.created_at.strftime('%m-%e-%y %H:%M'), r.cpu_usage] }
    heartbeats.each do |r|
      #@timestamps.push(r.created_at.strftime('%m-%e-%y %H:%M'))
      @cpu_data.push([(r.created_at - Time.new(1970, 01, 01)) * 1000, r.cpu_usage])
      @memory_data.push([(r.created_at - Time.new(1970, 01, 01)) * 1000, ((r.mem_used.to_f / r.mem_total.to_f).round(3) * 100).round(2)])
    end

  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to servers_path, notice: 'Server was successfully created.' }
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
        format.html { redirect_to servers_path, notice: 'Server was successfully updated.' }
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
      format.html { redirect_to servers_path, notice: 'Server was successfully destroyed.' }
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
