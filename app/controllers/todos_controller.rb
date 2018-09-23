class TodosController < ApplicationController
	def show
		@todo = Todo.find(params[:id])
	end
end