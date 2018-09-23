class ProjectsController < ApplicationController

	def index
		@projects = current_user.projects
	end

	def show
		@project = Project.find(params[:id])
		@project_todos = Todo.all.where(project_id: params[:id])
		@users_pro = UserProject.all.where(project_id: params[:id])
		binding.pry
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

	private

	def project_params
		params.require(:project).permit(:project_name, :goal, :created_by, :deadline)
	end

end


	