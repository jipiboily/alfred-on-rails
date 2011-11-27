window.Alfred = null;
# Create our application and namespace.
class Alfred extends Batman.App
  @global yes

  # setup our root route. When the app starts up, it will automatically call TodosController::index
  @root 'todos#index'


# Define the principal Todo model with `body` and `isDone` attributes, and tell it to persist itself using Local Storage.
class Alfred.Todo extends Batman.Model
  # @global exposes this class on the global object, so you can access `Todo` directly.
  @global yes

  # @persist tells a model which storage mechanism it should use to load and save. Batman.LocalStorage is the simplest, simply persisting your records to the browser storage.
  @persist Batman.RailsStorage

  # @encode tells the persistence mechanism which fields to archive. You can also setup specific encoder and decoder functions to handle specific types of data.
  @encode 'body', 'isDone'

  # just some defaults, but these are optional
  body: ''
  isDone: false

class Alfred.TodosController extends Batman.Controller
  emptyTodo: null

  index: ->
    @set 'emptyTodo', new Todo

    # add some example todos to show off.
    Todo.load (error, todos) ->
      # you always want to make sure you handle errors (more elegantly than this) when writing connection code
      throw error if error
      unless todos and todos.length
        callback = (error) -> throw error if error
        new Todo(body: 'joker escaped arkham again', isDone: true).save(callback)
        new Todo(body: 'riddler sent riemann hypothesis').save(callback)
        new Todo(body: 'bane wants to meet, not worried').save(callback)

    # prevent the implicit render of views/todos/index.html
    @render false

  create: =>
    @emptyTodo.save (error, record) =>
      throw error if error

      # we use set so that our form will automatically update with the new Todo instance
      @set 'emptyTodo', new Todo

    # since this isn't actually a route action, nothing will be rendered here.


# Start the app. This will start up the dispatcher and a number of other mechanisms.
Alfred.run()