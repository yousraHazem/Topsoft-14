jQuery ->
  window.chatController = new Chat.Controller($('#chat').data('uri'), true);

window.Chat = {}
class Chat.User
  constructor: (@user_name) ->
  serialize: => { user_name: @user_name }

class Chat.Controller
  template: (message) ->
    html =
      """
      <div class="message" >
        <label class="label label-info">
          [#{message.received}] #{message.user_name}
        </label>&nbsp;
        #{message.msg_body}
      </div>
      """
    $(html)

  # Initialization of the user list
  # Author: Mohamed Bahgat Elrakaiby 
  userListTemplate: (userList) ->
    userHtml = ""
    for user in userList
      userHtml = userHtml + "<li>#{user.user_name}</li>"
    $(userHtml)
  constructor: (url,useWebSockets) ->
    @messageQueue = []
    @dispatcher = new WebSocketRails(url,useWebSockets)
    @dispatcher.on_open = @createGuestUser
    @bindEvents()
  # Binding the events of the chat
  # Author: Mohamed Bahgat Elrakaiby
  bindEvents: =>
    @dispatcher.bind 'new_message', @newMessage
    @dispatcher.bind 'user_list', @updateUserList
    $('input#user_name').on 'keyup', @updateUserInfo
    $('#send').on 'click', @sendMessage
    $('#message').keypress (e) -> $('#send').click() if e.keyCode == 13
  # Pushing a new message to the message queue
  # Author: Mohamed Bahgat Elrakaiby
  newMessage: (message) =>
    @messageQueue.push message
    @shiftMessageQueue() if @messageQueue.length > 15
    @appendMessage message
  # A method to send the message
  # Author: Mohamed Bahgat Elrakaiby
  sendMessage: (event) =>
    event.preventDefault()
    message = $('#message').val()
    @dispatcher.trigger 'new_message', {user_name: @user.user_name, msg_body: message}
    $('#message').val('')
  # Updating the user list
  # Author: Mohamed Bahgat Elrakaiby
  updateUserList: (userList) =>
    $('#user-list').html @userListTemplate(userList)
  # Updating user info 
  # Author: Mohamed Bahgat Elrakaiby
  updateUserInfo: (event) =>
    @user.user_name = $('input#user_name').val()
    $('#username').html @user.user_name
    @dispatcher.trigger 'change_username', @user.serialize()
  # Appenging the message to messages
  # Author: Mohamed Bahgat Elrakaiby
  appendMessage: (message) ->
    messageTemplate = @template(message)
    $('#chat').append messageTemplate
    messageTemplate.slideDown 140
  #Shifting the message queue
  # Author: Mohamed Bahgat Elrakaiby
  shiftMessageQueue: =>
    @messageQueue.shift()
    $('#chat div.messages:first').slideDown 100, ->
      $(this).remove()
  # creating a user
  # Author: Mohamed Bahgat Elrakaiby
  createGuestUser: =>
    rand_num = Math.floor(Math.random()*1000)
    @user = new Chat.User("Guest_" + rand_num)
    $('#username').html @user.user_name
    $('input#user_name').val @user.user_name
    @dispatcher.trigger 'new_user', @user.serialize()
