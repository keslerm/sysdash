class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def systems
    systems = System.joins('LEFT OUTER JOIN heartbeats ON systems.id = heartbeats.system_id').includes(:messages).includes(:heartbeats).where('systems.last_heartbeat = heartbeats.created_at or systems.last_heartbeat is null').order(:name)

    json_data = []

    systems.each do |system|
      results = {}

      results['name'] = system.name
      results['ip'] = system.ip
      results['last_heartbeat'] = system.last_heartbeat.strftime('%Y-%m-%d %H:%M:%S %Z')
      results['uptime'] = system.heartbeats.last.uptime
      results['cpu_usage'] = system.heartbeats.last.cpu_usage.to_s + '%'
      results['mem_usage'] = ((system.heartbeats.last.mem_used.to_f / system.heartbeats.last.mem_total.to_f).round(3) * 100).round(2).to_s + '%'
      results['messages'] = system.messages.size

      json_data.push(results)
    end
    render json: json_data
  end

end
