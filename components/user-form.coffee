UserActions = require '../actions/user-actions'
UserStore = require '../stores/user-store'

Form = React.createClass

  getInitialState: ->
    UserStore.getUser()

  submit: (e) ->
    e.preventDefault()
    email = React.findDOMNode(@refs.email).value
    password = React.findDOMNode(@refs.password).value
    @setState email: email
    UserActions.submitSignIn email: email

  render: ->
    React.createElement(
      'div',
      {},
      React.createElement('input', { type: 'text', placeholder: 'email', ref: 'email' }, ''),
      React.createElement('input', { type: 'password', placeholder: 'password', ref: 'password' }, ''),
      React.createElement('input', { type: 'button', onClick: @submit, value: 'submit' }),
      React.createElement('h1', {}, "hello #{@state['email']}")
    )

React.render(
  React.createElement(Form, {}),
  document.getElementById('formC')
)
