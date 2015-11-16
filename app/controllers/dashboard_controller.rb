class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def systems
    systems = System.all.order('name asc')

    json_data = []

    systems.each do |system|
      results = {}

      results['name'] = system.name
      results['ip'] = system.ip
      results['last_heartbeat'] = system.last_heartbeat.created_at.strftime('%Y-%m-%d %H:%M:%S %Z')
      results['uptime'] = system.last_heartbeat.uptime
      results['cpu_usage'] = system.last_heartbeat.cpu_usage.to_s + '%'
      results['mem_usage'] = ((system.last_heartbeat.mem_used.to_f / system.last_heartbeat.mem_total.to_f).round(3) * 100).round(2).to_s + '%'
      results['messages'] = system.messages.size

      json_data.push(results)
    end
    render json: json_data
  end

end
