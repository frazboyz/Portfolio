class MilestonesController < ApplicationController

  # Require authentication for the following functions
  before_action :logged_in, :only => [
      :new, :create,
      :edit, :update,
      :delete, :destroy
  ]

  # Lists all the skills.
  # GET http://francismb.com/skills
  def index
    @milestones = logged_in ? Milestone.all : Milestone.where(:visible => true)
  end

  # Shows the contents of a skill.
  # GET http://francismb.com/skills/ID
  def show
    @milestone = logged_in ? Milestone.find(params[:id]) : Milestone.where(:id => params[:id]).where(:visible => true).first
  end

  # Shows the form to make a new skill.
  # Requires authentication.
  # GET http://francismb.com/skills/new
  def new
  end

  # Processes the form sent from the action #new and
  # creates a new skill if the information is valid.
  # Requires authentication.
  # POST http://francismb.com/skills
  def create
    @milestone = Milestone.new(milestone_params)
    if @milestone.valid? && @milestone.save
      redirect_to :action => :show, :id => @milestone.id
    else
      @errors = @milestone.errors
      render :action => :new
    end
  end

  # Shows the form to edit a persisted skill
  # Requires authentication.
  # GET http://francismb.com/skills/ID/edit
  def edit
    @milestone = Milestone.find(params[:id])
  end

  # Processes the form sent from the action #edit and
  # updates the skill if the information is valid.
  # Requires authentication.
  # PUT http://francismb.com/skills/ID
  def update
    @milestone = Milestone.find(params[:id])
    if @milestone.update(milestone_params)
      redirect_to :action => :show, :id => @milestone.id
    else
      @errors = @skill.errors
      render :action => :edit
    end
  end

  # Confirms if you want to delete a skill.
  # Requires authentication.
  # GET http://francismb.com/skills/delete/ID
  def delete
    @milestone = Milestone.find(params[:id])
  end

  # Deletes a persisted skill from the database.
  # Requires authentication.
  # DELETE http://francismb.com/skills/ID
  def destroy
    milestone = Milestone.find(params[:id])
    if milestone
      milestone.delete
    end
    redirect_to :action => :index
  end

  private

  def milestone_params
    params.require(:milestone).permit(:name, :summary, :content, :image, :date, :visible)
  end
end
