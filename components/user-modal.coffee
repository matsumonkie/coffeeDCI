UserStore = require '../stores/user-store'

Modal = React.createClass

  getInitialState: ->
    UserStore.getUser()

  componentDidMount: ->
    UserStore.addChangeListener(@onChange)

  onChange: ->
    console.log UserStore.getUser()
    @setState UserStore.getUser()

  render: ->
    React.createElement(
      'h1',
      {},
      "your name has been set to #{@state['name']}"
    )

React.render(
  React.createElement(Modal, {}),
  document.getElementById('modalC')
)
