window.MessageList = React.createClass
  render: ->
    messages = @props.messages.map (message) ->
      `<Message name={message.name} text={message.text} />`
    `<div>{messages}</div>`