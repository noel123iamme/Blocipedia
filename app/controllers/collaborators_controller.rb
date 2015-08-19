class CollaboratorsController < ApplicationController
  def create
    @user = current_user
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new(params[:wiki_id],params[:user_id])
    @new_collaborator = Collaborator.new
    if @collaborator.save
      flash[:notice] = 'Collaborator saved'
    else
      flash[:error] = 'Error saving collaborator.  Please try again.'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = 'Collaborator removed'
    else
      flash[:error] = 'Error removing collaborator'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
