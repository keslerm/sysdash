class SystemsController < ApplicationController
  before_action :set_server, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user

  # GET /servers/new
  def new
    @system = System.new
  end

  def index
    @systems = System.all
  end

  # GET /servers/1/edit
  def edit
  end

  def show
    # I'm not sure this is the best solution here if a server has millions of heartbeats.
    if @system.heartbeats.length == 0
      return
    end

    report = Reporting.new
    data = report.chart_data(@system, params[:timeperiod])

    @memory_data = data[:memory]
    @cpu_data = data[:cpu]

  end

  # POST /servers
  # POST /servers.json
  def create
    system = System.new(server_params)

    respond_to do |format|
      if system.save
        format.html { redirect_to systems_path, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: system }
      else
        format.html { render :new }
        format.json { render json: system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @system.update(server_params)
        format.html { redirect_to systems_path, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: system }
      else
        format.html { render :edit }
        format.json { render json: system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @system.destroy
    respond_to do |format|
      format.html { redirect_to systems_path, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @system = System.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:system).permit(:name, :token)
    end
end
