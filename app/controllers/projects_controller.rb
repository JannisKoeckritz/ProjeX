class ProjectsController < ApplicationController

	def index
		@projects = current_user.projects
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	
	end

	def create
		@project = Project.new(project_params)
		@project.created_by = current_user
		if @project.save
			flash[:success]="Das Projekt wurde erfolgreich angelegt"
			redirect_to project_path(@project)
		else
			flash[:danger]="Bitte überprüfen Sie Ihre Eingaben"
			render 'new'
		end
		current_user.projects << @project
	end

	private

	def project_params
		params.require(:project).permit(:project_name, :goal, :created_by)
	end
end


	