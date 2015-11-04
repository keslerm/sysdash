$ ->
  console.info("Messages loaded")

  $(".unhider").click ->
    id = $(this).attr("id")

    $("#message_" + id).toggle();
