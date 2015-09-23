class WikisController < ApplicationController

	before_action :set_wiki, only: [:show, :edit, :update, :destroy]
  def new
  	@wiki = Wiki.new
    authorize @wiki
  end

  def create
  	@wiki = Wiki.new(params_wiki)
    @wiki.user = current_user
    authorize @wiki
  	if @wiki.save
  		redirect_to wikis_path, notice: "New Wiki is saved."
  	else
  		flash[:error] = "Error saving a new Wiki."
  		render :new
  	end
  end

  def show
  	authorize @wiki
  end

  def index
  	@wikis = Wiki.all.paginate(page: params[:page], per_page: 20)
    authorize @wikis
  end

  def edit
    authorize @wiki
  end

  def update
    authorize @wiki
  	if @wiki.update_attributes(params_wiki)
  		redirect_to @wiki, notice: "Wiki is updated."
  	else
  		flash[:error] = "Error updating Wiki."
  		render :edit
  	end
  end

  def destroy
    authorize @wiki
  	if @wiki.destroy
  		redirect_to wikis_path, notice: 'Wiki is deleted.'
  	else
  		flash[:error] = "Error deleting"
  		redirect_to @wiki
  	end
  end



  private

  def params_wiki
  	params.require(:wiki).permit(:title, :body, :private)
  end

  def set_wiki
  	@wiki = Wiki.find(params[:id])
  end
end
