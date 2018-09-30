class ProjectsController < ApplicationController
	before_action :set_project, only: [:edit, :update, :show, :destroy]
	before_action :require_same_user, only: [ :show, :edit, :update, :destroy]
	
	def index
		@projects = current_user.projects
	end

	def show
		@project_todos = @project.todos
		@users_pro = current_user.projects
		$project = @project.id
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.created_by = current_user.email
		if @project.save
			current_user.projects << @project
			flash[:success]="Das Projekt wurde erfolgreich angelegt"
			redirect_to project_path(@project)
		else
			flash[:danger]="Bitte füllen Sie alle angegebenen Felder aus"
			render 'new'
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			flash[:warning] = "Projekt wurde erfolgreich geupdatet"
			redirect_to project_path(@project)
		else
			flash[:danger] = "Projekt konnte nicht aktualisiert werden"
			redirect_to myprojects_path
		end
	end

	def destroy
		@project.destroy
		flash[:danger] = "Projekt wurde erfolgreich gelöscht"
		redirect_to myprojects_path
	end

	private

	def project_params
		params.require(:project).permit(:project_name, :goal, :created_by, :deadline)
	end

	def set_project
		@project = Project.find(params[:id])
	end

	def require_same_user
		if @project.users.where(id: current_user.id).blank?
			flash[:danger] ="Du kannst nur an deinen eigenen Projekten arbeiten"
			redirect_to root_path
		end
	end

end


	