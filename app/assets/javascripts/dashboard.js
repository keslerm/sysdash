function loadDashboard() {
    $.getJSON("/dashboard/systems", function (data) {
        $("#dashboard-systems").html("");

        console.log(data);
        $.each(data, function (k, v) {
            $("#dashboard-systems").append("<tr>"
                + "<td>" + v.name + "</td>"
                + "<td>" + v.ip + "</td>"
                + "<td>" + v.last_heartbeat + "</td>"
                + "<td>" + v.uptime + "</td>"
                + "<td>" + v.cpu_usage + "</td>"
                + "<td>" + v.mem_usage + "</td>"
                + "<td>" + v.messages + "</td>"
                + "</tr>"
            )
        });
    });
}

$(function () {
    loadDashboard();

    setInterval("loadDashboard()", 60000);
});