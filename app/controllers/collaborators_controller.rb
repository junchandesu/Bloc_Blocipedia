class CollaboratorsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@wiki = Wiki.find(params[:wiki_id])
		@collaborator = Collaborator.new(user_id: @user, wiki_id: @wiki)
		@collaborator.user_id = @user.id 
		@collaborator.wiki_id = @wiki.id
		if @collaborator.save
			redirect_to :back
			flash[:notice] = "#{@user.name} has been added as your collaborator."
		else
			redirect_to :back
			flash[:error] = "Error saving your collaborator."
		end

		# respond_to do |format|
		# 	format.html
		# 	format.js
		# end
	end

	def destroy
		@user = User.find(params[:user_id])
		@wiki = Wiki.find(params[:wiki_id])
		@collaborator = Collaborator.where(user_id: @user, wiki_id: @wiki).first
		
		if @collaborator.destroy
			redirect_to :back, notice: "#{@user.name} has been removed as your collaborator."
		else
			redirect_to :back
			flash[:error] = "Error deleting this collaborator."
		end
	end


end