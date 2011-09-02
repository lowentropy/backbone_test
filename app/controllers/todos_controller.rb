class TodosController < ApplicationController
  respond_to :json
  respond_to :html, :only => :index
  
  expose :todo
  expose :todos do
    Todo.all
  end
  
  def index
    respond_with todos
  end
  
  def create
    todo.save
    respond_with todo
  end
  
  def destroy
    todo.destroy
    respond_with status: 'ok'
  end
  
  def update
    todo.save
    respond_with todo
  end
end