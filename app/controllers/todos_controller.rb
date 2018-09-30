class TodosController < ApplicationController
	before_action :set_todo, only: [:edit, :update, :show, :destroy]
	before_action :add_todo, only: [:add]

	def index
		@todos = current_user.todos
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			flash[:success] = "Die Aufgabe wurde dem Projekt erfolgreich hinzugefügt"
			redirect_to todo_path(@todo)
		else
			binding.pry
			flash[:danger] = "Bitte überprüfen Sie Ihre Eingaben"
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def add
		@new_assignment = UserTodo.new(user_id: current_user.id, todo_id: @todo.id)
		if @new_assignment.save
			flash[:success] = "Die Aufgabe wurde Ihnen erfolgreich zugewiesen"
			redirect_to mytodos_path
		else
			flash[:danger] = "Fehler beim Speichern des Eintrags. Bitte wenden Sie sich an den Administrator"
			redirect_to todo_path(@todo)
		end
	end

	private

	def get_status_of_curUT
		current_user.todos << @todo if @todo.params[:curUT] == 1
	end

	def set_todo
		@todo = Todo.find(params[:id])
	end

	def add_todo
		@todo = Todo.find(params[:format])
	end

	def todo_params
		params.require(:todo).permit(:task, :min_cost, :max_cost, :level, :project_id)
	end
end