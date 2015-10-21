UserActions = require '../actions/user-actions'
UserStore = require '../stores/user-store'

Form = React.createClass

  getInitialState: ->
    UserStore.getUser()

  submit: (e) ->
    e.preventDefault()
    name = React.findDOMNode(@refs.name).value
    @setState name: name
    UserActions.create name: name

  render: ->
    React.createElement(
      'div',
      {},
      React.createElement('input', { type: 'text', placeholder: 'name', ref: 'name' }, ''),
      React.createElement('input', { type: 'button', onClick: @submit, value: 'submit' }),
      React.createElement('h1', {}, "hello #{@state['name']}")
    )

React.render(
  React.createElement(Form, {}),
  document.getElementById('formC')
)
