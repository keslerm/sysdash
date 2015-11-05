class Reporting
  def chart_data(system, time_period)
    #

    # Default 30 minutes
    query = "select date_trunc('minute', created_at) as created_at, round(avg(cpu_usage)::numeric, 2) as cpu_usage, round(avg((mem_used::numeric(10,2)/mem_total::numeric(10,2))*100), 2) as mem_usage "
    query << "from heartbeats where system_id = #{system.id} and created_at >= current_timestamp - interval '1 hour hour' "
    query << "group by date_trunc('minute', created_at) "
    query << "order by date_trunc('minute', created_at)"

    # Not 100% sure on this

    if time_period == '2' # 24 hours
      query = "select date_trunc('hour', created_at) as created_at, round(avg(cpu_usage)::numeric, 2) as cpu_usage, round(avg((mem_used::numeric(10,2)/mem_total::numeric(10,2))*100), 2) as mem_usage "
      query << "from heartbeats where system_id = #{system.id} and created_at >= current_timestamp - interval '1 day' "
      query << "group by date_trunc('hour', created_at) "
      query << "order by date_trunc('hour', created_at)"
    elsif time_period == '3' # 1 week
      query = "select date_trunc('hour', created_at) as created_at, round(avg(cpu_usage)::numeric, 2) as cpu_usage, round(avg((mem_used::numeric(10,2)/mem_total::numeric(10,2))*100), 2) as mem_usage "
      query << "from heartbeats where system_id = #{system.id} and created_at >= current_timestamp - interval '1 week' "
      query << "group by date_trunc('hour', created_at) "
      query << "order by date_trunc('hour', created_at)"
    elsif time_period == '4' # 1 month
      query = "select date_trunc('hour', created_at) as created_at, round(avg(cpu_usage)::numeric, 2) as cpu_usage, round(avg((mem_used::numeric(10,2)/mem_total::numeric(10,2))*100), 2) as mem_usage "
      query << "from heartbeats where system_id = #{system.id} and created_at >= current_timestamp - interval '1 month' "
      query << "group by date_trunc('hour', created_at) "
      query << "order by date_trunc('hour', created_at)"
    end

    heartbeats = Heartbeat.connection.select_all(query)

    data = {
        cpu: [],
        memory: []
    }

    heartbeats.each do |r|
      data[:cpu].push([(Time.parse(r['created_at']) - Time.new(1970, 01, 01)) * 1000, r['cpu_usage'].to_f])
      data[:memory].push([(Time.parse(r['created_at']) - Time.new(1970, 01, 01)) * 1000, r['mem_usage'].to_f])
    end

    return data
  end
end