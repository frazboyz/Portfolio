class SkillsController < ApplicationController

  # Require authentication for the following functions
  before_action :require_authentication, :only => [
      :new, :create,
      :edit, :update,
      :delete, :destroy
  ]

  # Lists all the skills.
  # GET http://francismb.com/skills
  def index
    @skills = logged_in ? Skill.all : Skill.where(:visible => true)
  end

  # Shows one skill in-depth.
  # GET http://francismb.com/skills/show?id=?
  def show
    @skill = logged_in ? Skill.find(params[:id]) : Skill.where(:id => params[:id]).where(:visible => true).first
  end

  # Shows the form to make a new skill.
  # Requires authentication.
  # GET http://francismb.com/skills/new
  def new
  end

  # Processes the form sent from the action 'new' and
  # creates a new skill if the information is valid.
  # Requires authentication.
  # POST http://francismb.com/skills/create
  def create
    @skill = Skill.new(skill_params)
    if @skill.validate && @skill.save
      redirect_to :action => :show, :id => @skill.id
    else
      @errors = @skill.errors
      render :action => :new
    end
  end

  # Shows the form to edit a persisted skill
  # Requires authentication.
  # GET http://francismb.com/skills/edit?id=?
  def edit
    @skill = Skill.find(params[:id])
  end

  # Processes the form sent from the action 'edit' and
  # updates the skill if the information is valid.
  # Requires authentication.
  # PUT http://francismb.com/skills/update
  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to :action => :show, :id => @skill.id
    else
      @errors = @skill.errors
      render :action => :edit
    end
  end

  # Confirms if you want to delete a skill.
  # Requires authentication.
  # GET http://francismb.com/skills/delete?id=?
  def delete
    @skill = Skill.find(params[:id])
  end

  # Deletes a skill with the id supplied
  # Requires authentication.
  # DELETE http://francismb.com/skills/id=?
  def destroy
    skill = Skill.find(params[:id])
    if skill
      skill.delete
    end
    redirect_to :action => :index
  end

  private

  # The parameters required for a new skill
  def skill_params
    params.require(:skill).permit(:name, :color, :summary, :content, :knowledge, :visible)
  end

end
