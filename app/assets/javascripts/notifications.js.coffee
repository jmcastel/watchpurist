

class Notifications
 constructor: ->
    @notifications = $("[data-behavior='notifications']")

    if @notifications.length > 0
      @handleSuccess @notifications.data("notifications")
      $("[data-behavior='notifications-link']").on "click", @handleClick

      setInterval (=>
        @getNewNotifications()
      ), 5000

  getNewNotifications: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: ->
        $("[data-behavior='unread-count']").text("")
    )

  handleSuccess: (data) =>

    items = $.map data, (notification) ->
      "<a class='dropdown-item' href='#{notification.url}'>#{notification.actor} #{notification.action} </a><br>"
    
    $("[data-behavior='unread-count']").text(parseInt(items.length) || "") 
    $("[data-behavior='notification-items']").html(items)
    

  	

    

jQuery ->
  new Notifications
