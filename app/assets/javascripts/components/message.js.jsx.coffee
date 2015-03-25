window.Message = React.createClass
  render: ->
    `<div><strong>{this.props.name}: </strong>{this.props.text}</div>`