class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:success] = 'Your To Do was saved'
      redirect_to @todo
    else
      flash[:alert] = 'Your To Do was not saved. Please try again.'
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.save
      flash[:notice] = 'Your To Do was updated'
      redirect_to todos_path
    else
      flash[:alert] = 'Your To Do was not updated. Please try again.'
      render :edit
    end
  end

  def destroy
    if @todo.destroy
      flash[:notice] = "\"#{@todo.title}\" was deleted successfully."
      redirect_to todos_path
    else
      flash.now[:alert] = "There was an error deleting the To Do."
      render :show
    end
  end
end


private

def todo_params
  params.require(:todo).permit(:title)
end

def set_todo
  @todo = Todo.find(params[:id])
end
