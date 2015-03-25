window.Chat = React.createClass
  onNameChange: (e) ->
    @setState name: e.target.value

  onTextChange: (e) ->
    @setState text: e.target.value

  fetchMessage: ->
    $.ajax(
      url: "/messages"
      dataType: 'JSON'
      method: 'GET'
    ).done (data) =>
      console.log(data)
      @setState messages: data

  getInitialState: ->
    @fetchMessage()
    {text: '', name: 'Billy', messages: [{name: 'Billy', text: 'Wassup Yo!'}]}

  onSubmit: ->
    newMessage =
      text: @state.text
      name: @state.name
    @setState messages: @state.messages.concat([newMessage])
    $.ajax
      url: "/messages"
      data: {message: newMessage}
      dataType: 'JSON'
      method: 'POST'

  render: ->
    name = JSON.parse(@props.meta).title
    `<div>
      <h1>{name}</h1>
      <div>
        <MessageList messages={this.state.messages} />
      </div>
      <div>
        your name: <input onChange={this.onNameChange} />
        your message: <input onChange={this.onTextChange} />
        <button onClick={this.onSubmit}>Send it</button>
      </div>
      <button type="button" className="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Launch demo modal
      </button>

    </div>`
