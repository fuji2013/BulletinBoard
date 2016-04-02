# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', '#createComment', (xhr, data, status) ->
  location.reload()

$(document).on 'ajax:error', '#createComment', (xhr, data, status) ->
  form = $('#new_comment .modal-body')
  div = $('<div id="createCommentErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  data.responseJSON.messages.forEach (message, i) ->
    li = $('<li></li>').text(message)
    ul.append(li)

  if $('#createCommentErrors')[0]
    $('#createCommentErrors').html(ul)
  else
    div.append(ul)
    form.prepend(div)


# $(document).on 'ajax:success', '#createComment', (xhr, data, status) ->
#   location.reload()
#
# $(document).on 'ajax:error', '#createComment', (xhr, data, status) ->
#   form = $('#new_comment .modal-body')
#   div = $('<div id="createCommentErrors" class="alert alert-danger"></div>')
#   data.responseJSON.messages.forEach (message, i) ->
#     li = $('<li></li>').text(message)
#     ul.append(li)
#
#   if $('#createCommentErrors')[0]
#     $('#createCommentErrors').html(ul)
#   else
#     div.append(ul)
#     form.prepend(div)
