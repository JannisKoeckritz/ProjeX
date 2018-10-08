class TodosController < ApplicationController
	before_action :set_todo, only: [:edit, :update, :show, :destroy]
	before_action :require_same_user, only: [ :edit, :update, :destroy]
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
		if @todo.update(todo_params)
			flash[:warning] = "Aufgabe wurde erfolgreich geupdatet"
			redirect_to todo_path(@todo)
		else
			flash[:danger] = "Aufgabe konnte nicht aktualisiert werden"
			redirect_to mytodos_path
		end
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

	def finish
		@todo = Todo.find(params[:todo_id])
		@todo.finished = true
		if @todo.save
			flash[:success] = "Die Aufgabe wurde erfolgreich abgeschlossen"
			redirect_to mytodos_path
		else
			flash[:danger] = "Beim Abschließen der Aufgabe ist ein Fehler aufgetreten.
			 Bitte wenden Sie sich an den Administrator"
			 redirect_to mytodos_path
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

	def require_same_user
		if @todo.users.where(id: current_user.id).blank?
			flash[:danger] ="Du kannst nur an deinen eigenen Aufgaben arbeiten"
			redirect_to mytodos_path
		end
	end

	def todo_params
		params.require(:todo).permit(:task, :min_cost, :max_cost, :level, :project_id, :details)
	end
end