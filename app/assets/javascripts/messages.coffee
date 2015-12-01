$ ->
  $(".message").click ->
    id = $(this).attr('id')

    window.location.href = '/messages/' + id