class TodosController < ApplicationController
  before_action :todo_params, only: [:create, :update]
  before_action :set_todo, only: [:edit, :update, :show, :destroy]
  
  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Başarıyla güncelleme yapıldı"
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Başarıyla kayıt yapıldı"
      redirect_to todos_path
    else
      render :new
    end
  end

  def destroy
    @todo.destroy
    flash[:notice] = "Silme işlemi başarıyla gerçekleşti"
    redirect_to todos_path
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:body)
    end
end